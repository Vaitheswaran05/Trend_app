Trend Application – DevOps CI/CD Implementation

Project Overview

This project demonstrates a complete DevOps CI/CD workflow for deploying a web application using modern cloud-native tools. The application is containerized, deployed on AWS EKS, automated through Jenkins CI/CD, infrastructure is provisioned using Terraform, and application health is monitored using an open-source monitoring solution.

The implementation strictly follows the requirements provided in the GUVI assignment.

⸻

Tools & Technologies Used
	•	Version Control: Git, GitHub
	•	Containerization: Docker
	•	CI/CD: Jenkins
	•	Infrastructure as Code: Terraform
	•	Cloud Platform: AWS (EC2, IAM, EKS, Load Balancer)
	•	Container Orchestration: Kubernetes
	•	Monitoring: Uptime Kuma (Open Source)

⸻

Application Deployment
	•	The application source code is cloned from the provided repository.
	•	The application is containerized using Docker.
	•	The Docker image is built and verified locally.
	•	The containerized application is deployed on AWS EKS.
	•	The application is exposed using a Kubernetes LoadBalancer service.

The application is successfully accessible via the AWS LoadBalancer endpoint.

⸻

Docker Implementation
	•	Dockerfile is created to containerize the application.
	•	Docker image is built successfully.
	•	Image is pushed to DockerHub.
	•	The image is later pulled and deployed into Kubernetes via Jenkins.

⸻

Infrastructure Provisioning (Terraform)

Terraform is used to define and provision cloud infrastructure in a declarative manner.

Infrastructure Components Provisioned
	•	Virtual Private Cloud (VPC)
	•	Public Subnet
	•	Internet Gateway
	•	Route Table and Route Association
	•	Security Group
	•	EC2 Instance (used for Jenkins server)
	•	Networking components required for CI/CD operations

Note:
Kubernetes worker nodes are managed internally by AWS EKS. Terraform is included to demonstrate Infrastructure as Code principles by provisioning the supporting infrastructure required for Jenkins and networking.

⸻

IAM (Identity and Access Management)

IAM is configured to allow secure interaction between Jenkins and AWS services.
	•	An IAM user is created in AWS.
	•	Required permissions are granted to interact with EKS and related services.
	•	AWS credentials are securely stored in Jenkins credentials.
	•	No credentials are exposed in the GitHub repository.

⸻

Jenkins CI/CD Pipeline

Jenkins is used to automate the complete CI/CD lifecycle.

Pipeline Workflow
	1.	Source code is fetched from GitHub
	2.	Docker image is built
	3.	Docker image is pushed to DockerHub
	4.	Jenkins authenticates with AWS
	5.	Kubernetes deployment and service are applied to EKS

Automation
	•	GitHub Webhook is configured
	•	Every commit to the repository automatically triggers the Jenkins pipeline

⸻

Kubernetes (AWS EKS)
	•	AWS EKS cluster is configured and running
	•	Application is deployed using Kubernetes Deployment manifest
	•	Application is exposed using Kubernetes Service of type LoadBalancer
	•	Pods and services are verified to be running successfully

⸻

Monitoring

To monitor application availability, Uptime Kuma (open-source monitoring tool) is used.
	•	Uptime Kuma is deployed as a Docker container
	•	Application LoadBalancer endpoint is monitored
	•	Health status and uptime are visible through the monitoring dashboard

This satisfies the monitoring requirement of the assignment.

⸻

Version Control
	•	Complete codebase is maintained in GitHub
	•	.gitignore and .dockerignore files are configured
	•	All changes are committed and pushed using Git CLI
	•	Repository is clean and well-structured




Application Endpoint

The application is exposed using a Kubernetes LoadBalancer on AWS EKS.

🔗 LoadBalancer URL:
http://aa8b0509354334fed8788e2fbc99433e-1317600809.ap-south-1.elb.amazonaws.com/

⸻

Conclusion

This project demonstrates a complete DevOps lifecycle including infrastructure provisioning, CI/CD automation, container orchestration, monitoring, and secure cloud integration. All components are implemented using industry best practices and fully align with the GUVI DevOps assignment requirements.
