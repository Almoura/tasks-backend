pipeline {
    agent any
    stages {
        stage ('Build Backend') {
            steps {
               bat label: 'mvn clean package -DskipTests=true'
            }
        }
    }  
}