pipeline {
    agent { label 'GOL' }
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
        stage('build'){
            steps {
                echo env.GIT_URL
                sh "mvn ${params.GOAL}"
            }
        }
        stage('PostBuild'){
            steps {
                archive '**/gameoflife.war'
                junit '**/TEST-*.xml'
            }
        }
    }
    post {
        success {
            archive '**/gameoflife.war'
            junit '**/TEST-*.xml'
    }
}