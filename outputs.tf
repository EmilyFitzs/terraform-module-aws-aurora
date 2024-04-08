output "cluster_endpoint" {
  description = "The endpoint for the Aurora RDS cluster"
  value       = aws_rds_cluster.default.endpoint
}

output "reader_endpoint" {
  description = "The reader endpoint for the Aurora RDS cluster"
  value       = aws_rds_cluster.default.reader_endpoint
}

output "security_group_id" {
  description = "The ID of the security group attached to the RDS cluster instances"
  value       = aws_rds_cluster.default.vpc_security_group_ids
}
