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
        // ATENÇÃO! IMPORTANTE!
        // Estágios desabilitados por conta de problema relacionado ao nome "C:\users\André Moura". Em ambiente de produção, será
        // definido outro nome, sem acentuação gráfica em sem espaço separador.
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
        // stage ('Deploy Backend') {
        //     steps {
        //         deploy adapters: [tomcat8(credentialsId: 'TomcatLogin', path: '', url: 'http://localhost:8001/')], contextPath: 'tasks-backend', war: 'target/tasks-backend.war'
        //     }
        // }
        // stage ('API Test') {
        //     steps {
        //         git credentialsId: 'github_login', url: 'https://github.com/Almoura/tasks-api-test'
        //         powershell label: '', script: 'mvn test'
        //     }
        // }
    }  
}

