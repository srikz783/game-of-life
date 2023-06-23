pipeline {

    agent any
    triggers {
        pollSCM('* * * * *')
    }

    tools {
        java 'JAVA_8'
    }
    
    
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
