#!/bin/bash

#############################################################################
# This script will list all the resources in the AWS account
# Author: Deepak/DevOps Team
# Version: v0.0.1
#
# Following are the supported AWS services by the script
# 1. EC2
# 2. 53
# 3. RDS
# 4. DynamoDB
# 5. Lambda
# 6. EBS
# 7. ELB
# 8. CloudFront
# 9. CloudWatch
# 10. SNS
# 11. SQS
# 12. Route53
# 13. VPC
# 14. Cloudformation
# 15. IAM

# Usage: ./aws_resource_list.sh <region> <service_name>
# Example: ./aws_resource_list.sh us-east-1 EC2
#################################################################################

# Check if the required number of arguments are passed
if [ $# -ne 2 ]; then
echo "Usage: $0 <region> <service_name>"
exit 1
fi

# Check if the AWS CLI is installed

