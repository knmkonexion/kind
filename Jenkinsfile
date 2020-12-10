pipeline {

  agent { label 'master' }

  parameters {
    string(name: 'CLUSTER_NAME', defaultValue: 'k8s-test', description: 'What do you want to name you K8s/KinD cluster?')
  }

  environment {
    KIND_VERSION='v0.7.0'
  }

  stages {

    stage('KinD Version and Params') {
      steps {
        sh """
          echo 'KinD Version is: ${KIND_VERSION}'
          echo 'Creating cluster: ${CLUSTER_NAME}'
        """
      }
    }
  
    stage('List Files') {
      steps {
        sh('ls -alh')
      }
    }
  }
}