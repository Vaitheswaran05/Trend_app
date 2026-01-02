pipeline {
  agent any

  environment {
    AWS_DEFAULT_REGION = "ap-south-1"
    EKS_CLUSTER = "trend-cluster"
    IMAGE_NAME = "vaith/trend-app:latest"
  }

  stages {

    stage('Checkout') {
      steps {
        checkout scm
      }
    }

    stage('Build Docker Image') {
      steps {
        sh 'docker build -t $IMAGE_NAME .'
      }
    }

    stage('Push Docker Image') {
      steps {
        withCredentials([usernamePassword(
          credentialsId: 'Doc_hub',
          usernameVariable: 'DOCKER_USER',
          passwordVariable: 'DOCKER_PASS'
        )]) {
          sh '''
            echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin
            docker push $IMAGE_NAME
          '''
        }
      }
    }

    stage('Configure AWS & Deploy to EKS') {
      steps {
        withCredentials([
          string(credentialsId: 'aws-access-key', variable: 'AWS_ACCESS_KEY_ID'),
          string(credentialsId: 'aws-secret-key', variable: 'AWS_SECRET_ACCESS_KEY')
        ]) {
          sh '''
            aws sts get-caller-identity
            aws eks update-kubeconfig --region $AWS_DEFAULT_REGION --name $EKS_CLUSTER
            kubectl apply -f K8s/deployment.yaml --validate=false
            kubectl apply -f K8s/service.yaml --validate=false
          '''
        }
      }
    }
  }
}