pipeline {

    agent any
    triggers {
        pollSCM('* * * * *')
    }
    
    
    stages {
        stage('scm') {
            
            steps {
               // git branch: "master", url: 'https://github.com/asquarezone/game-of-life.git'
                //input message: 'Continue to next stage? ', submitter: 'qtaws,qtazure'
                
            }
        }
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
