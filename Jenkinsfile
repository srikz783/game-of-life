pipeline {
    agent { label 'SPC' }
    triggers {
        pollSCM ('* * * * *')
    }
    parameters {
        string(name: 'BRANCH', defaultValue: 'master', description: 'branch to build' )
        choice(name: 'GOAL', choices: ['package', 'clean package', 'install'], description: 'maven goals')
    }
    stages {
        stage('SCM'){
            steps {
                git branch: "${params.BRANCH}", url: 'https://github.com/srikz783/game-of-life.git'
            }
        }
        stage('COMPILE'){
            steps {
                sh 'mvn package'
            }
        }
        stage('PostBuild'){
            steps {
                archive '**/gameoflife.war'
                junit '**/TEST-*.xml'
            }
        }
    }
}