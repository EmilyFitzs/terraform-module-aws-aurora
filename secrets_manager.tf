resource "aws_secretsmanager_secret" "rds_master_password" {
  name        = "${var.cluster_identifier}-rds-master-password"
  description = "RDS cluster master password"
}

resource "aws_secretsmanager_secret_version" "rds_master_password" {
  secret_id     = aws_secretsmanager_secret.rds_master_password.id
  secret_string = var.db_master_password
}

variable "db_master_password" {
  description = "The master password for the RDS cluster"
  type        = string
  sensitive   = true
}

resource "random_password" "rds_master_password" {
  length  = 16
  special = true
  upper   = true
  lower   = true
}

resource "aws_secretsmanager_secret" "rds_master_password" {
  name        = "${var.cluster_identifier}-rds-master-password"
  description = "RDS cluster master password"
}

resource "aws_secretsmanager_secret_version" "rds_master_password" {
  secret_id     = aws_secretsmanager_secret.rds_master_password.id
  secret_string = random_password.rds_master_password.result
}
