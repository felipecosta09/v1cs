resource "aws_security_group" "v1cs-ecs-sg-mariogame" {
  name   = "${var.prefix}-ecs-sg-mariogame"
  vpc_id = aws_vpc.v1cs-ecs-vpc.id
  tags = {
    Name = "${var.prefix}-ecs-sg-mariogame"
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}