# Data source pour récupérer le VPC existant
data "aws_vpc" "ecoshop_vpc" {
  filter {
    name   = "tag:Name"
    values = ["ecosop-vpc"]
  }
}

# Data source pour récupérer les subnets publics
data "aws_subnets" "public" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.ecoshop_vpc.id]
  }
  filter {
    name   = "tag:Name"
    values = ["public-subnet-*"]
  }
}

# Data source pour récupérer les instances EC2 (serveurs app)
data "aws_instances" "app_servers" {
  filter {
    name   = "tag:Name"
    values = ["app-server-*"]
  }
  filter {
    name   = "instance-state-name"
    values = ["running"]
  }
}

# Data source pour récupérer le Security Group SG-Web
data "aws_security_group" "sg_web" {
  filter {
    name   = "tag:Name"
    values = ["SG-Web"]
  }
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.ecoshop_vpc.id]
  }
}

# Application Load Balancer
resource "aws_lb" "ecoshop_alb" {
  name               = "ecoshop-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [data.aws_security_group.sg_web.id]
  subnets            = data.aws_subnets.public.ids

  tags = {
    Name = "ecoshop-alb"
  }
}

# Target Group for ALB
resource "aws_lb_target_group" "ecoshop_tg" {
  name     = "ecoshop-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.ecoshop_vpc.id

  health_check {
    path = "/index.php"
    protocol = "HTTP"
    matcher  = "200"
    interval = 30
    timeout  = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

# Target Group Attachments
resource "aws_lb_target_group_attachment" "ecoshop_tg_attachment" {
  count            = length(data.aws_instances.app_servers.ids)
  target_group_arn = aws_lb_target_group.ecoshop_tg.arn
  target_id        = data.aws_instances.app_servers.ids[count.index]
  port             = 80
}

# Listener for ALB
resource "aws_lb_listener" "ecoshop_listener" {
  load_balancer_arn = aws_lb.ecoshop_alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.ecoshop_tg.arn
  }
}