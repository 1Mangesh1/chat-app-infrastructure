# Terraform AWS Infrastructure Setup

This sets up a basic AWS infrastructure using Terraform, including a VPC, subnet, security group, and EC2 instance.

## Prerequisites

- AWS Account
- AWS CLI installed and configured
- Terraform installed (version >= 1.0.0)
- SSH key pair for EC2 instance access


## Infrastructure Components

1. **VPC** (`10.0.0.0/16`)
   - DNS support enabled
   - DNS hostnames enabled

2. **Internet Gateway**
   - Attached to the VPC

3. **Public Subnet** (`10.0.1.0/24`)
   - Located in ap-south-1a
   - Auto-assigns public IPs

4. **Route Table**
   - Routes internet-bound traffic through IGW

5. **Security Group**
   - Inbound rules:
     - SSH (port 22)
     - Application (port 3000)
   - Outbound rules:
     - All traffic allowed

6. **EC2 Instance**
   - AMI: ami-0c50b6f7dc3701ddd
   - Type: t2.micro
   - Located in public subnet
   - Automatically assigns public IP

## Setup Instructions

1. **Initialize Terraform**
   ```bash
   terraform init
   ```

2. **Configure Variables**
   Create a `terraform.tfvars` file:
   ```terraform
   aws_region     = "ap-south-1"
   aws_access_key = "your-access-key"
   aws_secret_key = "your-secret-key"
   project_name   = "your-project-name"
   key_name       = "your-key-pair-name"
   ```

3. **Review Changes**
   ```bash
   terraform plan
   ```

4. **Apply Configuration**
   ```bash
   terraform apply
   ```

5. **SSH Into Instance**
   ```bash
   ssh -i your-key.pem ubuntu@<instance-public-ip>
   ```

## Cleanup

To destroy all created resources:
```bash
terraform destroy
```

## Security Notes

- The security group allows SSH access from any IP (`0.0.0.0/0`)
- Consider restricting SSH access to specific IP ranges
- Store sensitive variables in `terraform.tfvars` (git-ignored)

## Troubleshooting

1. **Connection Issues**
   - Verify security group rules
   - Check instance status
   - Ensure key pair permissions (chmod 400)

2. **Resource Creation Failures**
   - Verify AWS credentials
   - Check resource limits
   - Review error messages in terraform logs