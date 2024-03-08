pipeline {
    agent any
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
        stage('Build') {
            steps {
                echo "Building Docker images..."
                sh '''./img-build.sh'''
            }
        }
        stage('DeployToStaggingEnv') {
            steps{
                timeout(time:2, unit:'MINUTES') {
                    input message: 'Approve to Deploy to Stagging environment.'
                }
                echo "Deploying app to stagging environment..."
                sh '''./run-container.sh'''
            }
        }
        stage('PushToRegistry') {
            steps {
                timeout(time:5, unit:'MINUTES') {
                    input message: 'Approve to push image to registry.'
                }
                echo "Pushing docker image to Harbor Registry..."
                sh '''
                chmod +x img-push.sh
                ./img-push.sh''''
            }
        }
    }
}
