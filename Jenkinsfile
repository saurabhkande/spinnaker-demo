pipeline { 
 agent any 

    stages {
         stage('Code-pull') {
            steps {
                git branch: 'main', url: 'https://github.com/saurabhkande/spinnaker-demo.git'
                  }
             }
             
          stage("build-image") {
     
             steps {
			 
                sh "docker build . -t spin-img"
                sh "docker tag spin-img sau321/my-repo:spin"
                 } 
             }
          stage('Push Image to dockerhub') {
            steps {
                        sh "docker push sau321/my-repo:spin"
                    }
                }  
        }
}
