pipeline {

    agent { label 'GOL'}
    triggers {
        pollSCM('* * * * *')
    }
    parameters {
        string(name: 'BRANCH', defaultValue: 'master', description: 'Branch to build' )
        choice(name: 'GOAL', choices: ['package', 'clean package', 'install'], description: 'maven goals')
    }
    stages {
        stage('scm') {
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
                timeout(time:20, unit: 'MINUTES') {
                    sh "mvn ${params.GOAL}"
                }
                
            }
        }
        stage('Ansible') {
            agent { label 'DEV'}
            steps{
                // requires SonarQube Scanner for Maven 3.2+
                    sh 'cd Ansible && cd lampserver && ansible-playbook -i hosts apache.yaml'
                }
            }
        }
    }