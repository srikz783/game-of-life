pipeline {
    agent { label 'GOL' }
    triggers {
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
                echo env.GIT_URL{
                    sh "mvn ${params.GOAL}"
                }
                
            }
        }
        stage('SONAR ANALYSIS') {
            steps {
                withSonarQubeEnv('SONAR-8.9LTS'){
                // requires SonarQube Scanner for Maven 3.2+
                sh 'mvn org.sonarsource.scanner.maven:sonar-maven-plugin:3.7.0.1746:sonar'
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