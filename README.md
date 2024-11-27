# AWS EKS Infrastructure with Terraform

This project uses Terraform to deploy an AWS infrastructure that includes:
- A VPC with public subnets.
- An S3 bucket for static file hosting.
- An EKS cluster for running containerized applications.

## Prerequisites

Ensure you have these tools installed:
- **Terraform**: To manage the infrastructure.
- **AWS CLI**: To configure AWS credentials.
- **kubectl**: To interact with the EKS cluster.

## Getting Started

1. **Clone this repository**:
```bash
    git clone https://github.com/<your-username>/aws-eks-terraform-infra.git
    cd aws-eks-terraform-infra
```
2. **Initialize Terraform**:
```bash
    terraform init
```
3. **Deploy the Infrastructure**:
```bash
    terraform apply
```
4. **Access Output**: Note the outputs (e.g., S3 bucket URL, EKS cluster endpoint).

## Future Plans

- Add CI/CD for deployments.
- Deploy sample containerized applications on the EKS cluster.
- Implement logging and monitoring with tools like CloudWatch or Prometheus.
- Integrate secrets management with AWS Secrets Manager or HashiCorp Vault.
