pipeline {

  agent { label 'master' }

  parameters {
    string(name: 'CLUSTER_NAME', defaultValue: 'k8s-test', description: 'What do you want to name you K8s/KinD cluster?')
  }

  environment {
    KIND_VERSION='v0.7.0'
  }

  stages {

    stage('KinD Version') {
      steps {
        sh """
          echo 'KinD Version is: ${KIND_VERSION}'
        """
      }
    }
  
    stage('Any Clusters?') {
      steps {
        sh """
          kind get custers
        """
      }
    }

    stage('Create Cluster') {
      steps {
        sh """
          ./create_cluster ${CLUSTER_NAME}
        """
      }
    }
    
    stage('List Clusters') {
      steps {
        sh """
          kind get custers
        """
      }
    }

  }
}