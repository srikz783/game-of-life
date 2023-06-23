pipeline {

    agent any
    triggers {
        pollSCM('* * * * *')
    }
    JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
    
    stages {
        stage('build') {
            steps { 
                    sh "mvn package"
            }
        }
        
    }
    post {
        success {
            junit '**/TEST-*.xml'
        }
        
    }
}

// done
