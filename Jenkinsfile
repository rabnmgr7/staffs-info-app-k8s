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
                sh './img-build.sh'
            }
        }
        stage('PushToRegistry') {
            steps {
                timeout(time:5, unit:'MINUTES') {
                    input message: 'Approve to push image to registry.'
                }
                sh '''
                chmod +x img-push.sh
                ./img-push.sh'''
            }
        }
        stage('Deploy') {
            steps {
                timeout(time:5, unit:'MINUTES') {
                    input message: 'Approve to Deploy:'
                }
                sh '''
                ansible-playbook ./ansible/deploy.yaml'''
            }
        }
    }
}
