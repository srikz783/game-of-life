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
                mail subject: 'BUILD Started '+env.BUILD_ID, to: 'ksrikanth0293@gmail.com', from: 'jenkins@srikanth.com', body: 'EMPTY BODY'
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
            mail subject: 'BUILD Completed Successfully '+env.BUILD_ID, to: 'ksrikanth0293@gmail.com', from: 'jenkins@srikanth.com', body: 'EMPTY BODY'
        }
        failure {
            mail subject: 'BUILD Failed '+env.BUILD_ID+'URL is '+env.BUILD_URL, to: 'ksrikanth0293@gmail.com', from: 'jenkins@srikanth.com', body: 'EMPTY BODY'
        }
        always {
            echo "Finished"
        }
        changed {
            echo "Changed"
        }
        unstable {
            mail subject: 'BUILD Unstable '+env.BUILD_ID+'URL is '+env.BUILD_URL, to: 'ksrikanth0293@gmail.com', from: 'jenkins@srikanth.com', body: 'EMPTY BODY'

        }
    }
}