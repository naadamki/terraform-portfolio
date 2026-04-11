# ☁️ Terraform Portfolio Infrastructure

A fully serverless portfolio site deployed on AWS using Terraform.

## Architecture
S3 → CloudFront → (static site)
API Gateway → Lambda → DynamoDB → (visitor counter)

## Live Site
🔗 https://d1jbbku57rasp7.cloudfront.net

## Tech Stack
- **Terraform** — all infrastructure as code
- **AWS S3 + CloudFront** — static site hosting with CDN
- **AWS Lambda + Python** — serverless visitor counter
- **AWS DynamoDB** — NoSQL counter storage
- **AWS API Gateway** — HTTP API layer
- **Terraform Cloud** — remote state management

## Concepts Demonstrated
- Terraform modules (reusable, composable)
- Remote state backend (Terraform Cloud)
- IAM least-privilege roles
- CloudFront Origin Access Control (OAC)
- Infrastructure destroy/redeploy in < 3 minutes

## Deploy It Yourself
# Prerequisites: AWS CLI configured, Terraform CLI installed
terraform init
terraform plan
terraform apply
