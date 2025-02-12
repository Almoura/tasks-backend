pipeline { 
    agent any
    stages {
        stage ('Build Backend') {
            steps {              
                powershell label: '', script: 'mvn clean package -DskipTests=true'
            }
        }
        stage ('Unit Tests') {
            steps {              
                powershell label: '', script: 'mvn test'
            }
        }
        // stage ('Sonar Analysis') {
        //     environment {
        //         scannerHome = tool 'SONAR_SCANNER'
        //     }
        //     steps {  
        //         withSonarQubeEnv('SONAR_LOCAL') {
        //             powershell label: '', script: "${scannerHome}/bin/sonar-scanner -e -Dsonar.projectKey=DeployBackAndre -Dsonar.host.url=http://10.18.2.159:9000 -Dsonar.login=2ab5b28b9b6a242755dccd8d2b37178662d8c063 -Dsonar.java.binaries=target -Dsonar.coverage.exclusions=**/.mvn/**,**/src/test/**,**/model/**,**Application.java"
        //         }
        //     }
        // }
        // stage ('Quality Gate') {
        //     steps {
        //         sleep(5)
        //         timeout(time: 1, unit: 'MINUTES') {
        //             waitForQualityGate abortPipeline: true
        //         }
        //     }
        // }
        stage ('Deploy Backend') {
            steps {
                deploy adapters: [tomcat8(credentialsId: 'TomcatLogin', path: '', url: 'http://localhost:8001/')], contextPath: 'tasks-backend', war: 'target/tasks-backend.war'
            }
        }
        stage ('API Test') {
            steps {
                dir('api-test') {
                    git credentialsId: 'github_login', url: 'https://github.com/Almoura/tasks-api-test'         
                    powershell label: '', script: 'mvn test'
                }
            }
        }  
        stage ('Deploy Frontend') {
            steps {
                dir('frontend') {
                    git credentialsId: 'github_login', url: 'https://github.com/Almoura/tasks-frontend'
                    powershell label: '', script: 'mvn clean package'      
                    deploy adapters: [tomcat8(credentialsId: 'TomcatLogin', path: '', url: 'http://localhost:8001/')], contextPath: 'tasks', war: 'target/tasks.war'
                }
            }
        }  
        stage ('Functional Test') {
            steps {
                dir('functional-test') {
                    git credentialsId: 'github_login', url: 'https://github.com/Almoura/tasks-functional-tests'         
                    powershell label: '', script: 'mvn test'
                }
            }
        }
        stage ('Deploy Prod') {
            steps {
                powershell label: '', script: 'docker-compose build'
                powershell label: '', script: 'docker-compose up -d'
            }
        }
        stage ('Health Check') {
            steps {
                // Paralizará o fluxo para dar tempo para a aplicação subir antes de executar os testes
                sleep(5) 
                dir('functional-test') {
                    powershell label: '', script: 'mvn verify -Dskip.surefire.tests'
                }
            }
        }        
    } 
    post {
        always {
            junit allowEmptyResults: true, testResults: 'target/surefire-reports/*.xml, api-test/target/surefire-reports/*.xml, functional-test/target/surefire-reports/*.xml, functional-test/target/failsafe-reports/*.xml'
            archiveArtifacts artifacts: 'target/tasks-backend.war, frontend/target/tasks.war', onlyIfSuccessful: true
        }
        unsuccessful {
            emailext attachLog: true, body: 'See the attached log below', subject: 'Build $BUILD_NUMBER has failed', to: 'aluizmoura+jenkins@gmail.com'
        }
        fixed {
            emailext attachLog: true, body: 'See the attached log below', subject: 'Build is fine!', to: 'aluizmoura+jenkins@gmail.com'
        }
    } 
}

