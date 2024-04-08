resource "aws_security_group" "aurora_sg" {
  name        = "${var.cluster_identifier}-sg"
  description = "Security group for Aurora DB Cluster"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow PostgreSQL traffic"
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = []
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.cluster_identifier}-sg"
  }
}