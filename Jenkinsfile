pipeline{
    agent{'GOL'}
        stages{
            stage('Build') {
                steps {
                    git 'https://github.com/srikz783/game-of-life.git'
                    sh 'mvn package'
                }
            }
        }
}