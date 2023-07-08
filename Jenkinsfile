pipeline {
    agent any

    tools {
        mvn 'MAVEN'
    }
    stages {
        stage('VCS') {
            steps {
                git 'https://github.com/wakaleo/game-of-life.git'
            }
        }
        stage('build') {
            steps {
                sh 'export PATH="/usr/lib/jvm/java-1.8.0-openjdk-amd64/bin:$PATH" && mvn package'
            }
        }

        
            
        stage('post build') {
            steps {
                archiveArtifacts artifacts: '**/target/gameoflife.war',
                                 onlyIfSuccessful: true
                junit testResults: '**/surefire-reports/TEST-*.xml'
            }
        }
        stage ('Docker') {
            steps {
               // sh 'cd gameoflife-web'
                sh 'docker build --no-cache . -f gameoflife-web/Dockerfile'
                sh 'docker run -d -p 5000:5000 gameoflife'
            }
        }
        
    }

}
