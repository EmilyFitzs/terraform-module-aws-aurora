resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  engine = "aurora-postgresql"
  master_username         = "dbadmin"
  master_password = var.db_master_password.value
  backup_retention_period = 7 // TODO revise this value
  preferred_backup_window = "00:00-02:00"
  vpc_security_group_ids  = var.vpc_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.default.name
}