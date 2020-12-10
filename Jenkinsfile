pipeline {

  agent { label 'master' }

  parameters {
    string(name: 'CLUSTER_NAME', defaultValue: 'k8s-test', description: 'What do you want to name you K8s/KinD cluster?')
  }

  environment {
    KIND_VERSION='v0.7.0'
  }

  stages {

    stage('Install KinD') {
      steps {
        sh """
          ./install_kind.sh
        """
      }
    }

    stage('Create Cluster') {
      steps {
        sh """
          ./create_cluster.sh ${CLUSTER_NAME}
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