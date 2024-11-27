# AWS EKS Infrastructure with Terraform

This repository contains Terraform configurations for setting up a robust AWS infrastructure. The goal of this project is to deploy a scalable Kubernetes environment using Amazon EKS, along with supporting resources such as a VPC, subnets, and an S3 bucket for static file hosting.

## Overview

This project automates the creation of:
- A custom Virtual Private Cloud (VPC) with public subnets.
- An S3 bucket for hosting static content.
- An Amazon Elastic Kubernetes Service (EKS) cluster for containerized workloads.

By using Terraform, all resources are provisioned as code, making it easy to manage, version, and replicate the infrastructure.

## Features

- **Infrastructure as Code**: Complete deployment through Terraform.
- **Scalable Kubernetes Cluster**: Built on Amazon EKS, ready to run containerized applications.
- **Static File Hosting**: S3 bucket configured for serving static websites or assets.

## Prerequisites

Before using this project, make sure you have the following tools installed:

1. **Terraform**: To manage and apply the infrastructure code.
2. **AWS CLI**: To configure your AWS credentials locally.
3. **kubectl**: To manage the Kubernetes cluster after deployment.

## Getting Started

To deploy this infrastructure, follow these steps:

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
4. **Access Output**: After the deployment, Terraform will output important information like the S3 bucket URL and the EKS cluster endpoint

## Planned Improvements

Here are some ideas for improving this project in the future:

- Add a CI/CD pipeline for automatic deployments.
- Deploy sample containerized applications on the EKS cluster.
- Implement logging and monitoring with tools like CloudWatch or Prometheus.
- Explore integrating secrets management with AWS Secrets Manager or HashiCorp Vault.
