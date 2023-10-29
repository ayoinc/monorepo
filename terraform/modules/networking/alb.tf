resource "aws_lb" "alb" {
  name               = "container-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet.private.*.id
}

resource "aws_lb_listener" "listener" {
  load_balancer_arn = aws_lb.alb.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"
    fixed_response {
      status_code  = 200
      content_type = "text/plain"
      message_body = "OK"
    }
  }
}


resource "aws_lb_target_group" "target_group" {
  name        = "container-target-group"
  port        = 3000
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main.id
  target_type = "ip"

  health_check {
    interval            = 30
    path                = "/"
    timeout             = 3
    healthy_threshold   = 3
    unhealthy_threshold = 3
    protocol            = "HTTP"
    matcher             = "200-299"
  }
}



