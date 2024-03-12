#STAFFS-INFO-APP
1. This is a DevOps Workflow project for demonstrating following aspects of SDLC with Agile Method:
   - Code Management
   - Version Control System Git.
   - CI/CD Pipeline with Jenkins for:
      - testing,
      - building,
      - image pushing,
      - stagging,
      - deploying and
   - monitoring
2. We are going to use 'MySQL' like specialized database and 'Node.js' as our platform for creating highly performant web applications.
3. Building: Used Docker compose for building Docker Image.
4. Testing: For Analysis and Testing We used Sonarqube.
5. Registry: For Image Registry we have used Dockerhub but Harbor registry can also be used.
6. Stagging and Deployment: We used AWS EKS Cluster (AWS compliance Kubernetes Cluster) which is to be already setup.
7. Future Enhancement: For future enhancement, We will add following in this project:
     - Terraform: For AWS EKS Cluster Setup with IaaC (Infrastructure as a code) we'll use Terraform.
     - Ansible: For Configuration Management we'll use Ansible. Code is already in this project but there need to be error fixed.
     - Prometheus and Graphana: For monitoring purpose.
     - Nexus Artifactory: For storage of artifactory we'll use Nexus.

Guidelines:
1. Create two AWS EC2 Instances, remember two instances and EKS cluster should be in same Security group and necessary ports should be opened. Following are the instances and necessary requirements to be installed:
      - prjt-ws-inst: Install Jenkins, kubectl, awscli, registry(if required) in this instance.
      - prjt-sonar-inst: Sonarqube on another instance. 
3. Setup AWS EKS Cluster with NodeGroup.
4. Provide access to your local machine or prjt-ws-inst and configure aws cli and kubeconfig for already created AWS EKS Cluster (confirm by running 'kubectl get nodes').
5. Install Sonarqube Scanner plugin on Jenkins and Integrate SonarQube with Jenkins.
6. Setup Jenkins Pipeline with SCM (this repo URL) and Jenkinsfile as pipeline build Jenkinsfile.
7. Run the Build.
8. Check the following results on respective URLs:
   - Sonarqube code analysis
   - Image on Dockerhub
   - Run Command on local machine/prjt-ws-inst: 'kubectl get deployments' and 'kubectl get services'
9. Check deployments and services are running or not.
10. If services are running Copy 'EXTERNAL IP:PORT' of staffs-info-app-node:$BUILD_NUMBER service and browse on web.
11. Click on 'View Employee Details'

Project Workflow:
1. CodeFetch ----> SonarAnalysis ----> ImgBuild ----> PushToRegistry ----> DeployToStagginEnv ----> DeployToProductionEnv ----> GoToStageCodeFetch

#ScreenShots
1. Following are the Intro to technologies used and screenshots of the deployed project:
<p align="center">
    <img src="Screenshots/docker_nodejs.png" alt="docker_compose" width="50%"/>
</p>

<p align="center">
    <img src="Screenshots/mysql.jpg" alt="docker_compose" width="50%"/>
</p>
<p align="center">
    <img src="Screenshots/index.png" alt="docker_compose" width="70%"/>
</p>
<p align="center">
    <img src="Screenshots/addEmployee.png" alt="docker_compose" width="70%">
</p>
<p align="center">
    <img src="Screenshots/employee.png" alt="docker_compose" width="70%">
</p>
