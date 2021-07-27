node('GOL') {
    stage('scm') {
        git 'https://github.com/srikz783/openmrs-core.git'
    }
    stage('Build') {
        sh 'mvn package'
    }
    stage('postBuild') {
        junit '**/TEST-*.xml'
        archive '**/*.war'
    }
}

