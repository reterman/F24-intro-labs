# Terraform and Nginx Deployment

## Terraform Version
- Installed version: `v1.9.5-dev` 

## Installation Steps
1. **Install Terraform:**
   - Installed Terraform using Snap package manager with the following command:
     ```bash
     sudo snap install terraform --classic
     ```

## Terraform Commands
1. **Initialize Terraform:**
     ```bash
     terraform init
     ```

2. **Apply Configuration:**
     ```bash
     terraform apply
     ```

3. **Destroy Infrastructure:**
     ```bash
     terraform destroy
     ```

## Observations and Challenges
- **Installation Issues:**
  - The version installed via Snap was not the latest. Snap repositories may not always have the most up-to-date versions.

- **Deployment Challenges:**
  - Encountered issues with network configuration and image IDs in the Terraform setup. Verified that all IDs were correct and resolved access issues by adjusting permissions and settings in the cloud provider.
  - The user-data script for Nginx required careful checking to ensure proper installation and service startup.

