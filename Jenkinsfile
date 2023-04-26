pipeline{

agent {
  label 'linux-agent '
}

 tools {
    jdk 'jdk-11'
    terraform 'terraform'
    git 'Default'
    maven 'maven3'
 }
stages{

 stage('Checkout'){
    steps{
  
  checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/TafariBeckford/Complete-CI-CD.git']])


    }
   

 }

 stage('Unit Test'){
   steps{

       sh 'mvn clean test'
    }
   
 }

 stage('Integration Test'){
    steps{
        sh 'mvn verify -DskipUnitTests'
        }
   
 }


stage('SonarQube analysis') {
   steps{
    withSonarQubeEnv(credentialsId: 'sonarqube', installationName: 'SonarCloud') {
    sh 'mvn clean package sonar:sonar'
    }
    }

}

    }

}