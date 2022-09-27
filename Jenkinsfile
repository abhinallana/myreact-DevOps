pipeline {
  agent any
    
  tools {nodejs "nodejs"}
    
  stages {

    stage('Install dependencies') {
      steps {
        sh 'npm install'
      }
    }
     
    stage('Build') {
      steps {
         sh 'npm run build'
      }
    } 
    stage('Test') {
      steps {
        sh 'npm run test'
      }
    }
    
    stage('Package') {
      steps {
         sh 'ls -lrt'
         sh "pwd"
         sh "tar -zcf build.tar.gz build/"
      }
    }  
    stage('Initialize'){
      steps{
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
        sh 'sudo usermod -a -G docker jenkins'
      }
    }


    stage('Docker Build') {
      steps {
        sh 'docker build -t abhinallana/react_app:1.0.0 .'
        sh 'docker --version'
      }
    }
  }
}
