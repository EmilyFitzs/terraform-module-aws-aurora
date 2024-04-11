variable "vpc_id" {
  description = "The ID of the VPC where the DB cluster is to be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the DB instances"
  type        = list(string)
}

variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the RDS cluster"
  type        = list(string)
}

variable "cluster_identifier" {
  description = "The identifier for the RDS cluster"
  type        = string
  default     = "default-aurora-db-cluster"
}

variable "access_key" {
  description = "Access key for AWS provider"
  type        = string
}

variable "secret_key" {
  description = "Secret key for AWS provider"
  type        = string
}

variable "target_bucket_name" {
  description = "The name of the S3 bucket to be used as the target for DMS"
  type        = string
  default     = "my-dms-target-bucket-default"
}