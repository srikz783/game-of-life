pipeline {
    agent { label 'SPC' }
    stages {
        stage('SCM'){
            steps {
                git 'https://github.com/srikz783/game-of-life.git'
            }
        }
        stage('COMPILE'){
            steps {
                sh 'mvn package'
            }
        }
        stage('PostBuild'){
            steps {
                archive '**/gameoflife.war'
                junit '**/TEST-*.xml'
            }
        }
    }
}