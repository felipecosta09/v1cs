resource "aws_ecs_cluster" "v1cs-ecs-cluster" {
  name = "v1cs-ecs-cluster"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
  tags = {
    Name = "v1cs-ecs-cluster"
  }
}