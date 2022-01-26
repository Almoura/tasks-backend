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
        stage ('Quality Gate') {
            steps {
                timeout(time: 1, unit: 'MINUTES')
                waitForQualityGate abortPipeline: true
            }
        }
    }  
}
