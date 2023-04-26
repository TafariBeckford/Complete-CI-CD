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

   checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/TafariBeckford/Complete-CI-CD.git']])

 }

 stage('Unit Test'){

   sh 'mvn clean test'
 }

 stage('Integration Test'){

   sh 'mvn verify -DskipUnitTests'
 }


stage('SonarQube analysis') {

    withSonarQubeEnv(credentialsId: 'sonarqube') {
    sh 'mvn clean package sonar:sonar'
}

}

            }

}