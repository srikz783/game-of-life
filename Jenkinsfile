pipeline {
    agent { label 'GOL' }
    triggers {
        cron('H * * * *')
        pollSCM('* * * * *')
    }
    stages {
        stage('SCM') {
            steps {
                git branch: 'master', url: 'https://github.com/srikz783/game-of-life.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
    }
    post {
        success {
            archive '**/*.war'
            junit '**/TEST-*.xml'
        }
    }
}