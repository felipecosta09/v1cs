resource "aws_security_group" "v1cs-ecs-sg-nginx" {
  name   = "v1cs-ecs-sg-nginx"
  vpc_id = aws_vpc.v1cs-ecs-vpc.id
  tags = {
    Name = "v1cs-ecs-sg-nginx"
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    self        = "false"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}