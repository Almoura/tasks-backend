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
    }  
}