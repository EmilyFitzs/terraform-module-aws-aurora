resource "aws_db_subnet_group" "default" {
  name       = "${var.cluster_identifier}-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_rds_cluster" "default" {
  cluster_identifier      = "aurora-cluster"
  availability_zones      = ["us-west-2a", "us-west-2b", "us-west-2c"]
  database_name           = "mydb"
  engine = "aurora-postgresql"
  master_username         = "dbadmin"
  master_password         = "7g!pV4$3hT"  # TODO need to manage this securely with secret manager
  backup_retention_period = 7 // TODO revise this value
  preferred_backup_window = "00:00-02:00"
  vpc_security_group_ids  = var.vpc_security_group_ids
  db_subnet_group_name    = aws_db_subnet_group.default.name
}

resource "aws_rds_cluster_instance" "writer" {
  count              = 1
  identifier = "aurora-cluster-writer"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.r4.large"
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version
  promotion_tier     = 0
}

resource "aws_rds_cluster_instance" "reader" {
  count              = 1
  identifier = "aurora-cluster-reader"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.r4.large"
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version
  promotion_tier     = 15 // TODO - not sure what this should be yet
}