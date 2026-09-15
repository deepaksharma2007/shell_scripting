# AWS Resource Tracker 🚀

A simple Bash script to list AWS resources using the **AWS CLI**.

The `aws_resource_tracker.sh` script accepts an AWS Region and AWS service name as arguments and executes the appropriate AWS CLI command to retrieve the resources.

---


## 📌 Features

- Simple Bash-based AWS resource inventory script
- Uses the AWS CLI
- Accepts AWS Region as an argument
- Supports multiple AWS services
- Validates the number of input arguments
- Checks whether AWS CLI is installed
- Provides service-specific AWS CLI commands
- Easy to extend with additional AWS services

---
## 📌 Overview

Managing and tracking AWS resources across different services can sometimes be time-consuming.

This script provides a simple command-line solution to retrieve resources from commonly used AWS services.

You can specify:

- AWS Region
- AWS Service

The script then executes the appropriate AWS CLI command.

### Basic Usage

```bash
./aws_resource_tracker.sh <region> <service_name>
```
---
## ☁️ Supported AWS Services

The script currently supports the following AWS services:

| # | AWS Service | Service Name |
|---|-------------|--------------|
| 1 | Amazon EC2 | `ec2` |
| 2 | Amazon S3 | `s3` |
| 3 | Amazon RDS | `rds` |
| 4 | Amazon DynamoDB | `dynamodb` |
| 5 | AWS Lambda | `lambda` |
| 6 | Amazon EBS | `ebs` |
| 7 | Amazon CloudFront | `cloudfront` |
| 8 | Amazon CloudWatch | `cloudwatch` |
| 9 | Amazon SNS | `sns` |
| 10 | Amazon SQS | `sqs` |
| 11 | Amazon Route 53 | `route53` |
| 12 | Amazon VPC | `vpc` |
| 13 | AWS CloudFormation | `cloudformation` |
| 14 | AWS IAM | `iam` |

---

## 🛠️ Prerequisites

Before running the script, make sure the following are installed and configured.

### 1. AWS CLI

Verify that AWS CLI is installed:

```bash
aws --version
```
If AWS CLI is not installed, install it according to your operating system.

Configure your AWS credentials:
```bash
aws configure
```
You need to provide aws credentials
```bash
AWS Access Key ID [None]: ****************
AWS Secret Access Key [None]: ****************
Default region name [None]: us-east-1
Default output format [None]: json
```

### 2. AWS IAM permissions
The AWS identity used to execute the script must have the required permissions for the AWS service being queried.

---
## 📥 Clone the Repository
Clone the repository:
```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
```

Navigate to the repository:
```bash
cd <YOUR_REPOSITORY_NAME>
```

## Make script executable
Give execute permission to the script:
```bash
chmod +x aws_resource_tracker.sh
ls -l aws_resource_tracker.sh
```
---
# 💡 Examples
### 1. EC2
List EC2 instances:
```bash
./aws_resource_tracker.sh us-east-1 ec2
```
The script executes:
```bash
aws ec2 describe-instances --region us-east-1
```
### 2. S3
List S3 buckets:
```bash
./aws_resource_tracker.sh us-east-1 s3
```
The script executes:
```bash
aws s3api list-buckets --region us-east-1
```
Similarly, you can specify different AWS services as an argument to the script and retrieve the corresponding resource information from your AWS account.

---

# 🔎 Script Execution Flow
The script performs the following operations:
## Step 1: Validate Arguments
The script checks whether exactly two arguments are provided.
```bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 <region> <service_name>"
    exit 1
fi
```

## Step 2: Assign Arguments
The arguments are assigned to variables:
```bash
aws_region=$1
aws_service=$2
```
The variables become:
```bash
aws_region=us-east-1
aws_service=ec2
```
## Step 3: Check AWS CLI
The script verifies whether AWS CLI is installed:
```bash
if ! command -v aws &> /dev/null; then
    echo "AWS CLI is not installed. Please install it and try again."
    exit 1
fi
```
## Step 4: Identify the Service
The script uses a Bash case statement:
```bash
case $aws_service in
    ec2)
        echo "Listing EC2 Instances in $aws_region"
        aws ec2 describe-instances --region $aws_region
        ;;
    rds)
        echo "Listing RDS Instances in $aws_region"
        aws rds describe-db-instances --region $aws_region
        ;;
esac
```
## Step 5: Execute AWS CLI Command

Based on the selected service, the corresponding AWS CLI command is executed.

For example:
```bash
aws ec2 describe-instances --region us-east-1
```
AWS then returns the resource information.
---

## 👨‍💻 Author
Deepak Sharma
DevOps Engineer

## 📜 Version
v0.0.1

## 📄 License
This project is created for:

- Learning
- DevOps practice
- AWS automation
- AWS CLI practice
- Infrastructure management

## ⭐ Support

If you find this project useful, please consider giving the repository a ⭐ on GitHub.
