resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster"
  availability_zones      = ["us-east-1e", "us-east-1a"]
  database_name           = "mydb"
  engine                  = "aurora-postgresql"
  engine_version          = "16.1"
  master_username         = "dbadmin"
  master_password         = random_password.rds_master_password.result
  backup_retention_period = 7
  preferred_backup_window = "00:00-02:00"
  vpc_security_group_ids  = var.vpc_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.default.name
  skip_final_snapshot     = true
  final_snapshot_identifier = "final-snapshot-${random_string.timestamp.result}-${random_string.snapshot_suffix.result}"

  lifecycle {
    ignore_changes = [final_snapshot_identifier]
  }

}
