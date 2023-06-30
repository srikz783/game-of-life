pipeline {
    agent { label 'GOL' }
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

        stage ('Docker') {
            steps {
                sh 'docker build '
                sh 'docker build -t gameoflife .'
                sh 'docker run -d -p 5000:5000 gameoflife'
            }
        }
            
        stage('post build') {
            steps {
                archiveArtifacts artifacts: '**/target/gameoflife.war',
                                 onlyIfSuccessful: true
                junit testResults: '**/surefire-reports/TEST-*.xml'
            }
        }
        
    }

}
