#ALB
resource "aws_lb" "scott_alb" {
  name               = "scott-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.sg_id]
  subnets            = var.subnets

  tags = {
    Name = "scott-alb"
  }
}

# Listener
resource "aws_lb_listener" "scott_listener" {
  load_balancer_arn = aws_lb.scott_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.scott_tg.arn
  }
}

# Target Group
resource "aws_lb_target_group" "scott_tg" {
  name     = "scott-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
}

# Target Group Attachment
resource "aws_lb_target_group_attachment" "scott_tga" {
  count            = length(var.instances)
  target_group_arn = aws_lb_target_group.scott_tg.arn
  target_id        = var.instances[count.index]
  port             = 80
}
