resource "aws_dms_replication_instance" "default" {
  replication_instance_id     = "${var.cluster_identifier}-rep-instance"
  replication_instance_class  = "dms.t2.micro"
  allocated_storage           = 20
  vpc_security_group_ids      = var.vpc_security_group_ids
  replication_subnet_group_id = aws_dms_replication_subnet_group.default.id
  multi_az                    = false
  publicly_accessible         = false
  apply_immediately           = true
  auto_minor_version_upgrade  = true
  tags = {
    Name = "${var.cluster_identifier}-rep-instance"
  }
  kms_key_arn = aws_kms_key.dms_kms_key.arn
}

resource "aws_kms_key" "dms_kms_key" {
  description = "KMS key for encrypting DMS storage"
  policy      = <<POLICY
{
  "Version": "2012-10-17",
  "Id": "key-default-1",
  "Statement": [
    {
      "Sid": "Enable IAM User Permissions",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root"
      },
      "Action": "kms:*",
      "Resource": "*"
    }
  ]
}
POLICY
}
