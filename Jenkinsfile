pipeline{
    agent any
    tools{
        maven 'MAVEN'
    }
    stages{
        stage('github-webhook'){
            steps{
                script{
                    properties([pipelineTriggers([githubPush()])])
                }
            }
        }
        stage('checkout'){
            steps{
                git branch: 'FIRST', url: 'https://github.com/chaithanya1812/test2.git'
            }
        }
        stage('BUILD'){
            steps{
                sh 'mvn clean package'
            }
        }
        stage('SonarQube Report'){
            steps{
                sh 'mvn sonar:sonar'
            }
        }
        
        stage('docker build'){
            steps{
            sh 'docker build -t 3.109.60.48:8083/typing-game:latest .'
            sh 'docker build -t 3.109.60.48:8083/typing-game:$BUILD_ID .'
            }
        }
        stage('NEXUS LOGIN'){
            steps{
                withCredentials([string(credentialsId: 'nexuslogin', variable: 'NEXUS')]) {
                sh 'docker login -u admin --password $NEXUS 3.109.60.48:8083' 
                    //  Always use single Quations for credentialsId login
            }
               sh 'docker push 3.109.60.48:8083/typing-game:latest'
               sh 'docker push 3.109.60.48:8083/typing-game:$BUILD_ID'
               sh 'docker rmi  -f 3.109.60.48:8083/typing-game:latest'
               sh 'docker rmi -f 3.109.60.48:8083/typing-game:$BUILD_ID'
               
            }
            
        }
        stage('To run containers'){
            steps{
                script{
                    def runcontainer = "docker run -d --name c1 -p 8091:8080 3.109.60.48:8083/typing-game:latest"
                    sshagent(['ec2-user']) {
                        sh "ssh -o StrictHostKeyChecking=no ec2-user@13.234.48.130 $runcontainer"
                      }
                    
                    
                }
            }
            
        }
    }
}
