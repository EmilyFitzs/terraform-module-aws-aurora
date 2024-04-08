variable "vpc_security_group_ids" {
  description = "List of VPC security group IDs to associate with the RDS cluster"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC where the DB cluster is to be deployed"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the DB instances"
  type        = list(string)
}

variable "cluster_identifier" {
  description = "The identifier for the RDS cluster"
  type        = string
}
