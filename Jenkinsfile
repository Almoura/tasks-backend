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
        stage ('Sonar Analysis') {
            environment {
                scannerHome = tool 'SONAR_SCANNER'
            }
            steps {              
                powershell label: '', script: "${scannerHome}/bin/sonar_scanner -e " PAREI AQUI
            }
        }
    }  
}