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








Simple Bash-based AWS resource inventory script

Uses the AWS CLI

Accepts the AWS Region as an argument

Supports multiple AWS services

Validates the number of input arguments

Checks whether AWS CLI is installed

Provides service-specific AWS CLI commands

☁️ Supported AWS Services

The current script supports the following services:

#   AWS Service          Service Name

1    Amazon EC2           ec2
2    Amazon S3            s3
3    Amazon RDS           rds
4    Amazon DynamoDB      dynamodb
5    AWS Lambda           lambda
6    Amazon EBS           ebs
7    Amazon CloudFront    cloudfront
8    Amazon CloudWatch    cloudwatch
9    Amazon SNS           sns
10   Amazon SQS           sqs
11   Amazon Route 53      route53
12   Amazon VPC           vpc
13   AWS CloudFormation   cloudformation
14   AWS IAM              iam

Note: Although ELB is mentioned in the script comments, there is
currently no elb case in the script. ELB support can be added in a
future version.

🛠️ Prerequisites

Before running the script, make sure the following are installed and
configured:

1. AWS CLI

Install and verify AWS CLI:

aws --version

Configure your AWS credentials:

aws configure

Verify that your credentials work:

aws sts get-caller-identity

2. Bash

The script requires a Bash shell.

For Linux/macOS:

bash --version

For Windows, you can use WSL or Git Bash.

3. Required IAM Permissions

The AWS identity running the script must have permission to call the
relevant Describe, List, or equivalent AWS API operations.

For example, EC2 resource tracking requires permission for:

ec2:DescribeInstances

The required permissions depend on the service being queried.

📥 Clone the Repository

git clone <YOUR_GITHUB_REPOSITORY_URL>
cd <YOUR_REPOSITORY_NAME>

Make the script executable:

chmod +x aws_resource_tracker.sh

🚀 Usage

The basic syntax is:

./aws_resource_tracker.sh <region> <service_name>

Example

List EC2 instances in us-east-1:

./aws_resource_tracker.sh us-east-1 ec2

List RDS databases:

./aws_resource_tracker.sh us-east-1 rds

List S3 buckets:

./aws_resource_tracker.sh us-east-1 s3

List Lambda functions:

./aws_resource_tracker.sh us-east-1 lambda

List VPCs:

./aws_resource_tracker.sh us-east-1 vpc

List CloudFormation stacks:

./aws_resource_tracker.sh us-east-1 cloudformation

📋 Example Output

For example, when querying EC2:

Listing EC2 Instances in us-east-1

{
    "Reservations": [
        {
            "Instances": [
                {
                    "InstanceId": "i-xxxxxxxxxxxxxxxxx",
                    "InstanceType": "t3.micro",
                    "State": {
                        "Name": "running"
                    }
                }
            ]
        }
    ]
}

The exact output depends on the AWS resources available in your account
and the permissions of the configured AWS identity.

🔍 How the Script Works

The script follows these basic steps:

User
  |
  | Region + Service
  v
aws_resource_tracker.sh
  |
  +--> Validate arguments
  |
  +--> Check AWS CLI
  |
  +--> Check AWS configuration
  |
  +--> Identify requested service
  |
  +--> Execute AWS CLI command
  |
  v
AWS Account
  |
  v
Resource Information

Step 1: Validate Arguments

The script expects exactly two arguments:

./aws_resource_tracker.sh <region> <service_name>

If the required arguments are not provided, the script displays the
usage information and exits.

Step 2: Check AWS CLI

The script verifies that the AWS CLI is available:

command -v aws

Step 3: Select the AWS Service

A Bash case statement determines which AWS CLI command should be
executed.

For example:

case $aws_service in
    ec2)
        aws ec2 describe-instances --region $aws_region
        ;;
    rds)
        aws rds describe-db-instances --region $aws_region
        ;;
esac

Step 4: Query AWS

The corresponding AWS CLI command is executed against the specified
region.

📁 Repository Structure

.
├── aws_resource_tracker.sh
└── README.md

⚠️ Important Notes

Global vs Regional Services

Not every AWS service is strictly regional.

For example:

S3 buckets are globally managed even though buckets have a
region.

IAM is a global service.

CloudFront is a global service.

Route 53 is a global service.

Therefore, the --region argument does not have the same meaning for
every service.

For global services, AWS CLI behavior may depend on the command and
configured/default region.

Script Validation

The original script contains a couple of syntax/consistency issues that
should be corrected before running it:

This line needs a comment marker:

# Check if the AWS CLI is configured

instead of:

Check if the AWS CLI is configured

The directory test contains a syntax error:

if [ ! -d ~/.aws ]; ]then

It should be:

if [ ! -d ~/.aws ]; then

The usage comment refers to:

aws_resource_list.sh

while the script filename is:

aws_resource_tracker.sh

The README uses aws_resource_tracker.sh consistently.

The service list in the comments mentions ELB, but the case
statement currently does not implement elb.

🔐 Security

Do not hard-code AWS access keys or secret keys inside the script.

Avoid:

AWS_ACCESS_KEY_ID="your-access-key"
AWS_SECRET_ACCESS_KEY="your-secret-key"

Instead, use the AWS CLI credential configuration:

aws configure

or an appropriate IAM role, instance profile, SSO configuration, or
other AWS-supported credential mechanism.

Never commit:

~/.aws/credentials

to GitHub.

🔮 Future Improvements

Possible enhancements for future versions:

Add Elastic Load Balancer (ALB/NLB) support

Add EKS support

Add API Gateway support

Add Elastic Beanstalk support

Add CloudWatch Logs support

Add resource counts instead of raw JSON only

Add --output table support

Add CSV/JSON export

Add support for multiple regions

Add an option to scan all supported services

Improve error handling

Validate AWS credentials using aws sts get-caller-identity

Add color-coded terminal output

Add logging

Add parallel execution for faster inventory collection

👨‍💻 Author

Deepak Sharma
DevOps Engineer

📜 Version

v0.0.1

📄 License

This project is provided for learning and DevOps automation purposes.
Add the license appropriate for your GitHub repository.
