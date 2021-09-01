pipeline{
    agent { label 'SPC'}
    triggers {
        pollSCM('* * * * *')
    }
    stages {
        stage('scm') {
            steps {
                git 'https://github.com/srikz783/game-of-life.git'
            }
        }
        stage('build') {
            steps {
                sh "mvn package"
            }
        }
    }
}