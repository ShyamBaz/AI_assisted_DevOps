#!/bin/bash

#####################################################################
# Description: This script creates an AWS EC2 instance using AWS CLI.
# Verify If user has AWS installed
# It requires AWS CLI to be installed and configured with appropriate permissions.
# - Creates a key pair if it doesn't exist.
# - Creates a security group with SSH access if it doesn't exist.
# - Launches an EC2 instance with specified parameters.
# - Outputs the instance ID and public DNS.
#####################################################################
# Usage: ./aws_ec2_create.sh <key_name> <security_group_name> <instance_type> <ami_id> <region>
# Example: ./aws_ec2_create.sh myKeyPair mySecurityGroup t2.micro ami-0abcdef1234567890 us-west-2
#####################################################################

if [ "$#" -ne 5 ]; then
    echo "Usage: $0 <key_name> <security_group_name> <instance_type> <ami_id> <region>"
    exit 1
fi
KEY_NAME="$1"
SECURITY_GROUP_NAME="$2"
INSTANCE_TYPE="$3"
AMI_ID="$4"
REGION="$5"
# Check if AWS CLI is installed
if ! command -v aws &> /dev/null; then
    echo "AWS CLI not found. Please install and configure AWS CLI."
    exit 1
fi
# Check if AWS CLI is configured
if ! aws sts get-caller-identity &> /dev/null; then
    echo "AWS CLI is not configured. Please configure it with 'aws configure'."
    exit 1
fi
# Create Key Pair if it doesn't exist
if ! aws ec2 describe-key-pairs --key-names "$KEY_NAME" --region "$REGION" &> /dev/null; then
    echo "Creating key pair: $KEY_NAME"
    aws ec2 create-key-pair --key-name "$KEY_NAME" --query 'KeyMaterial' --output text --region "$REGION" > "${KEY_NAME}.pem"
    chmod 400 "${KEY_NAME}.pem"
else
    echo "Key pair $KEY_NAME already exists."
fi
# Create Security Group if it doesn't exist
if ! aws ec2 describe-security-groups --group-names "$SECURITY_GROUP_NAME"
then
    echo "Creating security group: $SECURITY_GROUP_NAME"
    GROUP_ID=$(aws ec2 create-security-group --group-name "$SECURITY_GROUP_NAME" --description "Security group for SSH access" --region "$REGION" --query 'GroupId' --output text)
    aws ec2 authorize-security-group-ingress --group-id "$GROUP_ID" --protocol tcp --port 22 --cidr
    echo "Security group $SECURITY_GROUP_NAME created with ID $GROUP_ID"
else
    echo "Security group $SECURITY_GROUP_NAME already exists."
    GROUP_ID=$(aws ec2 describe-security-groups --group-names "$SECURITY_GROUP
_NAME" --region "$REGION" --query 'SecurityGroups[0].GroupId' --output text)
fi
# Launch EC2 Instance
echo "Launching EC2 instance..."
INSTANCE_ID=$(aws ec2 run-instances --image-id "$AMI_ID" --count
    1 --instance-type "$INSTANCE_TYPE" --key-name "$KEY_NAME" --security-group-ids "$GROUP_ID" --region "$REGION" --query 'Instances[0].InstanceId' --output text)
echo "Instance launched with ID: $INSTANCE_ID"
# Wait for the instance to be in running state
echo "Waiting for instance to be in 'running' state..."
aws ec2 wait instance-running --instance-ids "$INSTANCE_ID" --region "$REGION
"
# Get Public DNS of the instance
PUBLIC_DNS=$(aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --
    region "$REGION" --query 'Reservations[0].Instances[0].PublicDnsName' --output text)
echo "Instance is running. Public DNS: $PUBLIC_DNS"
echo "You can connect to the instance using: ssh -i ${KEY_NAME}.pem ec2-user@$PUBLIC_DNS"
--cidr
# Note: The default user for Amazon Linux AMI is 'ec2-user'. Adjust accordingly for other AMIs.

22 --cidr