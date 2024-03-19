pipeline {
    agent {
        label 'slave-shesh-node'
    }
    environment {
        scannerHome = tool 'sonar5.0'
    }
    stages {
        stage('SonarAnalysis') {
            steps {
                echo "Doing SonarAnalysis..."
                withSonarQubeEnv('sonar') {
                    sh """${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=staffs-info \
                        -Dsonar.projectName=staffs-info \
                        -Dsonar.projectVersion=1.0.0 \
                        -Dsonar.sources=. \
                        -Dsonar.exclusions='./node/api/node_modules/**' \
                        -Dsonar.language=dockerfile \
                        -Dsonar.sourceEncoding=UTF-8 \
                        -Dsonar.inclusions='**/Dockerfile'
                    """
                }
            }
        }
        stage('ImgBuild') {
            steps {
                sh """echo "Building Docker Images!!!"
                ./img-build.sh"""
            }
        }
        stage('PushToRegistry') {
            steps {
                sh '''echo "Pushing Images to DockerHub!!!"
                chmod +x img-push.sh
                ./img-push.sh'''
            }
        }
        stage('DeployToStaggingEnv') {
            steps {
                sh ''' echo "Deploying Application to Stagging Environment..."
                ./create-service.sh'''
            }
        }
        stage('DeployToProductionEnv') {
            steps {
                timeout(time:5, unit:'MINUTES') {
                    input message: 'Approve to Deploy:'
                }
                sh ''' echo "Deploying Application to Production Environment..."
                ./create-service.sh'''
            }
        }
    }
}
