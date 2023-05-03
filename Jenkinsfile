pipeline{

agent {
  label 'linux-agent '
}

 tools {
    jdk 'jdk-17'
    maven 'maven3'

 }
  environment{
        SCANNER_HOME= tool 'sonar-scanner'
        DOCKERHUB = credentials('dockerhub')
        
    }
stages{

 stage('Checkout'){
    steps{
  checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/TafariBeckford/Complete-CI-CD.git']])
 }
   
 }

 stage('Unit Test'){
   steps{
        sh 'mvn test'
    }
   
 }

 stage('Integration Test'){
    steps{
        sh 'mvn verify -DskipUnitTests'
        }
   
 }


stage('SonarQube Analysis') {
   steps{
    withSonarQubeEnv('sonar-scanner') {
     sh ''' $SCANNER_HOME/bin/sonar-scanner -Dsonar.projectName=Devops-CICD \
                  -Dsonar.java.binaries=. \
                  -Dsonar.organization=tafari-organization \
                  -Dsonar.projectKey=Devops-CICD \
                  -Dsonar.sources=. \
                  -Dsonar.host.url=https://sonarcloud.io
                   
                   '''
    }
    }

}

 stage('Quality Gates') {
            steps {
                
            waitForQualityGate abortPipeline: false, credentialsId: 'sonarqube'
            
            }
 }

 stage('Code-Build') {
            steps {
               sh "mvn clean install"
            }
    }
stage('Image Build'){
    
    steps {
    
        sh "docker build -t tafaribeckford/pet-clinic-876:latest . "
        
}
    
    
}
stage('Image Push'){
     steps {
            sh "docker login --username $DOCKERHUB_USR --password-stdin $DOCKERHUB_PSW"
            sh "docker push tafaribeckford/pet-clinic-876:latest"
      
      }
       }
} 
     
}

