pipeline { 
 agent any 

    stages {
         stage('Code-pull') {
            steps {
                git branch: 'main', url: 'https://Saurabhkande@bitbucket.org/drl-task/final-mule.git'
                  }
             }
          
          stage('Execute Sonarqube') {
        	steps {
   				   withSonarQubeEnv('sonar-scanner') {
   			     	  
                    sh "${scannerPath}/sonar-scanner"
                  
               }
           }
        }
              stage("Quality Gate") { 
                   steps { 
              timeout(time: 5, unit: 'MINUTES') {
              waitForQualityGate abortPipeline: true
              }            
           }
        }
          stage('project-build') {
                steps {
                   sh "mvn clean install"
                }
             }
             
          stage("build-image") {
     
             steps {
                sh "docker build . -t mule-img"
                sh "docker tag mule-img 009609560581.dkr.ecr.ap-south-1.amazonaws.com/drl-ecr-repo:latest"
        } 
     }
          stage('Push Image to ECR') {
            steps {
                        sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 009609560581.dkr.ecr.ap-south-1.amazonaws.com"
                        sh "docker push 009609560581.dkr.ecr.ap-south-1.amazonaws.com/drl-ecr-repo:latest"
                    }
                }  
             
            stage('deploy') {
                 steps {
                   sh "mvn clean deploy -DmuleDeploy"
                }
             }
        }
}
