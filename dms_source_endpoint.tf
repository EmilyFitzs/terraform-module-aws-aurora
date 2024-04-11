resource "aws_dms_endpoint" "source" {
  endpoint_id   = "${var.cluster_identifier}-source-endpoint"
  endpoint_type = "source"
  engine_name   = "aurora-postgresql"
  username      = "dbadmin"
  password      = random_password.rds_master_password.result
  server_name   = aws_rds_cluster.default.endpoint
  port          = 5432
  database_name = "mydb"
  ssl_mode      = "none"

  tags = {
    Name = "${var.cluster_identifier}-source-endpoint"
  }
}