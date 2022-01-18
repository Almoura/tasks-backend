pipeline {
    agent any
    stages {
        stage ('Build Backend') {
            steps {
               bat label: '', script: 'mvn clean package -DskipTests=true'
            }
        }
    }  
}