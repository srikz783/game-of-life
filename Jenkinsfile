pipeline {
    agent { label 'GOL' }
    stages {
        stage('SCM') {
            steps {
                git 'https://github.com/srikz783/game-of-life.git'
            }
        }
        stage('COMPILE'){
            steps {
                sh 'mvn package'
            }
        }
    }
}