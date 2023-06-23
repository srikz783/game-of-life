pipeline {

    agent any
    triggers {
        pollSCM('* * * * *')
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
