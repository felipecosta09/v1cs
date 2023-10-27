resource "aws_ecs_task_definition" "v1cs-ecs-task-nginx" {
  family                   = "service"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 512
  memory                   = 2048
  tags = {
    Name = "v1cs-ecs-task-nginx"
  }
  container_definitions    = <<DEFINITION
  [
    {
      "name"      : "nginx",
      "image"     : "nginx:latest",
      "cpu"       : 512,
      "memory"    : 2048,
      "essential" : true,
      "portMappings" : [
        {
          "containerPort" : 80,
          "hostPort"      : 80
        }
      ]
    }
  ]
  DEFINITION
}

resource "aws_ecs_service" "v1cs-ecs-service-nginx" {
  name             = "nginx-service"
  cluster          = aws_ecs_cluster.v1cs-ecs-cluster.id
  task_definition  = aws_ecs_task_definition.v1cs-ecs-task-nginx.id
  desired_count    = 1
  launch_type      = "FARGATE"
  platform_version = "LATEST"
  tags = {
    Name = "v1cs-ecs-service-nginx"
  }

  network_configuration {
    assign_public_ip = true
    security_groups  = [aws_security_group.v1cs-ecs-sg-nginx.id]
    subnets          = [aws_subnet.v1cs-ecs-subnet.id]
  }
  lifecycle {
    ignore_changes = [task_definition]
  }
}