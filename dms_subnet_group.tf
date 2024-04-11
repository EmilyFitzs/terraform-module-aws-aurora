resource "aws_dms_replication_subnet_group" "default" {
  replication_subnet_group_id          = "${var.cluster_identifier}-rep-subnet-group"
  replication_subnet_group_description = "DMS Replication Subnet Group"
  subnet_ids                           = var.subnet_ids

  tags = {
    Name = "${var.cluster_identifier}-rep-subnet-group"
  }
}