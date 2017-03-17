node {
  stage('build') {
    checkout scm
    docker.build('thomasnordquist/docker-cordova-build-environment', '--no-cache')
  }
}
