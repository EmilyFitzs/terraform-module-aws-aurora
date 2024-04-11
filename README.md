# AWS Database Migration Service (DMS) Terraform Module

This Terraform module provisions an AWS Database Migration Service (DMS) environment to facilitate data migration from an Aurora PostgreSQL database to an S3 bucket for storage and further processing.

## Prerequisites

- **Terraform**: Version 1.0.0 or newer.
- **AWS Provider**: Version 3.48.0 or newer.
- **AWS Account**: Appropriate permissions are required to create and manage the AWS resources detailed below.

## Resources Created

This module orchestrates the creation of:

- **Aurora PostgreSQL RDS Cluster**: Comprises one writer and one reader instance for efficient data management and retrieval.
- **S3 Bucket**: Serves as the destination for data migrated from the Aurora PostgreSQL database, facilitating storage and subsequent processing.
- **DMS Replication Instance**: Acts as the engine that performs the data migration between the source database and the target S3 bucket.
- **DMS Source Endpoint**: Configured to connect to the Aurora PostgreSQL database, acting as the starting point for the migration process.
- **DMS Target Endpoint**: Established to connect to the designated S3 bucket, where the migrated data is deposited.
- **IAM Role and Policy**: Grants the DMS service the necessary permissions to access and interact with the S3 bucket.

## Usage Guide

1. **Repository Cloning**:
   Begin by cloning the repository to your local environment to get started with the module.

2. **Variable Configuration**:
     These variables serve as placeholders for your actual environment-specific values. The key variables include:
    - `vpc_id`: Identifier for the VPC intended for the DB cluster deployment.
    - `subnet_ids`: Collection of subnet IDs designated for the DB instances.
    - `vpc_security_group_ids`: List of security group IDs within the VPC to be associated with the RDS cluster.
    - `cluster_identifier`: Unique identifier for the RDS cluster.
    - `access_key` and `secret_key`: Credentials for AWS provider authentication.
    - `target_bucket_name`: Name assigned to the S3 bucket used as the migration target.

For setting the values for the declared variables, create a file named `terraform.tfvars` at the root of your Terraform project directory. This file is automatically loaded by Terraform during operations, but make sure it's included in your `.gitignore` to prevent sensitive data from being committed.

In your `terraform.tfvars` file, assign values to each of the variables you declared in `variables.tf`. For example:

   ```hcl
   vpc_id                 = "vpc-123abcd"
   subnet_ids             = ["subnet-abc123", "subnet-def456"]
   vpc_security_group_ids = ["sg-789xyz"]
   cluster_identifier     = "my-cluster-id"
   access_key             = "AKIAIOSFODNN7EXAMPLE"
   secret_key             = "wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY"
   target_bucket_name     = "my-dms-target-bucket"
```  

Note: Ensure sensitive information like access_key and secret_key is managed securely, preferably using a secrets manager or environment variables, rather than hardcoding them.

3. **Terraform Initialization**:
   With Terraform installed, initialize your workspace by running the following command:

   ```terraform init```

4. **Execution Plan**:
   Generate an execution plan to preview the changes Terraform will perform:

    ```terraform plan```

5. **Apply Changes**:
   Apply the Terraform configuration to create the DMS environment:

    ```terraform apply```
