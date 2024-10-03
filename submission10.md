# Cloud Computing Lab - Artifact Registries and Serverless Platforms Comparison

## Task 1: Artifact Registries Analysis

| Provider       | Artifact Registry                     | Key Features |
| -------------- | ------------------------------------- | ------------ |
| **Google Cloud**| **Artifact Registry**                | - Centralized platform for managing containers and package libraries<br>- Compatible with Docker images and formats like Maven, npm, and Python<br>- Tight integration with GKE and Cloud Run for automated deployments<br>- Provides granular access management through IAM roles |
|               | **Container Registry**                | - Specialized for storing and managing Docker container images<br>- Includes vulnerability scanning for security<br>- Uses regional storage locations to optimize deployment times<br>- Works with Google Kubernetes Engine (GKE) and DevOps tools for smooth CI/CD pipelines |
| **Amazon Web Services** | **Amazon Elastic Container Registry (ECR)** | - Fully managed registry for Docker containers<br>- Native support for AWS services like ECS, EKS, and Lambda<br>- Provides lifecycle policies for managing unused images<br>- Secure, with data encryption at rest and during transmission |
|                | **AWS CodeArtifact**                 | - Repository service for software dependencies<br>- Supports popular formats like NuGet, Maven, npm, and PyPI<br>- Integrated with AWS DevOps tools (CodeBuild, CodePipeline)<br>- Allows for easy sharing of artifacts across teams securely |
| **Microsoft Azure**| **Azure Container Registry (ACR)** | - Managed Docker registry with support for geo-replication<br>- Works with Azure Kubernetes Service (AKS) and App Services for fast deployments<br>- Provides enterprise-grade security with Azure Active Directory (AD) and role-based access control (RBAC)<br>- Enables image signing and scanning |
|                | **Azure Artifacts**                  | - Universal package manager for development teams<br>- Supports a wide range of formats (Maven, npm, NuGet, PyPI)<br>- Deep integration with Azure DevOps for seamless package management<br>- Facilitates secure sharing and version control for project dependencies |

---

## Task 2: Serverless Computing Platforms Overview

| Provider       | Serverless Platform                   | Key Features |
| -------------- | ------------------------------------- | ------------ |
| **Microsoft Azure**| **Azure Functions**               | - Event-driven serverless compute platform<br>- Supports multiple triggers like HTTP requests, timers, and database events<br>- Deep integration with Azure services such as Event Grid and Cosmos DB<br>- Multiple runtime options including Python, JavaScript, and .NET |
|                | **Azure Container Instances (ACI)**  | - Serverless container hosting with instant provisioning<br>- No infrastructure management needed; works well with AKS and VNet<br>- Pricing based on CPU and memory usage<br>- Ideal for running containers in a simplified manner |
| **Google Cloud**| **Google Cloud Functions**           | - Event-based compute service that scales automatically<br>- Works well with other GCP services like Pub/Sub, Firestore, and Storage<br>- Supports various runtimes, including Node.js, Python, and Go<br>- Great for lightweight, on-demand execution of functions |
|                | **Google Cloud Run**                 | - Fully managed container-based serverless platform<br>- Auto-scales based on traffic, handling any containerized application<br>- Designed for ease of use, with "pay only when the container runs" pricing model<br>- Provides high flexibility with support for any language that runs in a container |
| **Amazon Web Services**| **AWS Lambda**                | - Event-triggered compute service<br>- Automatically scales based on incoming requests<br>- Supports popular languages like Python, Java, Node.js, and more<br>- Charges based on the number of requests and function execution time |
|                | **AWS Fargate**                      | - Serverless platform for running containers without managing servers<br>- Supports orchestration with ECS and EKS<br>- No need for manual infrastructure management, only pay-per-use based on container execution<br>- Ideal for deploying and scaling containerized applications without worrying about the underlying environment |


