pipeline {

    agent { label 'GOL'}
    triggers {
        pollSCM('* * * * *')
    }
    parameters {
        string(name: 'BRANCH', defaultValue: 'master', description: 'Branch to build' )
        choice(name: 'GOAL', choices: ['package', 'clean package', 'install'], description: 'maven goals')
    }
    environment {
        CI_ENV = 'DEV'
    }
    stages {
        stage('scm') {
            environment {
                DUMMY = 'FUN'
            }
            steps {
                git branch: "${params.BRANCH}", url: 'https://github.com/asquarezone/game-of-life.git'
                //input message: 'Continue to next stage? ', submitter: 'qtaws,qtazure'
                echo env.CI_ENV
                echo env.DUMMY
            }
        }
        stage('build') {
            steps {
                echo env.GIT_URL
                timeout(time:10, unit: 'MINUTES') {
                    sh "mvn ${params.GOAL}"
                }
                stash includes {'**/gameoflife.war'} name: 'golwar'
            }
        }
        stage('Ansible') {
            agent { label 'DEV'}
            steps{
                // requires SonarQube Scanner for Maven 3.2+
                    unstash name: 'golwar'
                }
            }
        
    }
    post {
        success {
            archive '**/gameoflife.war'
            junit '**/TEST-*.xml'
        }
        
    }
}
