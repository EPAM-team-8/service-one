# ALB

resource "aws_lb" "service-one-alb" {
  name               = "service-one-alb"
  internal           = false
  load_balancer_type = "application"

  security_groups = [
    data.aws_security_group.sg.id
  ]
  subnets = [data.aws_subnet.public_subnet.id, data.aws_subnet.private_subnet.id]
}

# ALB Listener

resource "aws_lb_listener" "forward_api" {
  load_balancer_arn = aws_lb.service-one-alb.arn
  port              = "8080"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service-one-tg.arn
  }
}

resource "aws_lb_listener" "forward_service" {
  load_balancer_arn = aws_lb.service-one-alb.arn
  port              = "8082"
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.service-one-tg.arn
  }
}

# ALB Target Group

resource "aws_lb_target_group" "service-one-tg" {
  name     = "service-one-tg"
  port     = "80"
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.my-vpc.id

  health_check {
    path    = "/"
    matcher = "200-399"
  }
}

resource "aws_lb_target_group_attachment" "tg" {
  target_group_arn = aws_lb_target_group.service-one-tg.arn
  target_id        = aws_instance.Service-One.id
  port             = 8082
}
