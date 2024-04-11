resource "aws_dms_endpoint" "target" {
  endpoint_id     = "${var.cluster_identifier}-target-endpoint"
  endpoint_type   = "target"
  engine_name     = "s3"
  server_name     = var.target_bucket_name

  s3_settings {
    bucket_name               = var.target_bucket_name
    service_access_role_arn   = aws_iam_role.dms_access_role.arn
  }

  tags = {
    Name = "${var.cluster_identifier}-target-endpoint"
  }
}

resource "aws_iam_role" "dms_access_role" {
  name = "${var.cluster_identifier}-dms-access-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = "sts:AssumeRole",
        Effect = "Allow",
        Principal = {
          Service = "dms.amazonaws.com"
        },
      },
    ]
  })
}

resource "aws_iam_role_policy" "dms_s3_access" {
  name   = "${var.cluster_identifier}-dms-s3-access-policy"
  role   = aws_iam_role.dms_access_role.id

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:ListBucket"
        ],
        Effect = "Allow",
        Resource = [
          "arn:aws:s3:::${var.target_bucket_name}",
          "arn:aws:s3:::${var.target_bucket_name}/*"
        ]
      },
    ]
  })
}