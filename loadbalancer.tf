##################################################################################
# LOADBALANCER
##################################################################################

# AWS_LB
resource "aws_lb" "nginx" {
  name               = "altschool-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nginx-alb-sg.id]
  subnets            = module.vpc.public_subnets

  enable_deletion_protection = false


  tags = local.common_tags
}

# AWS_LB_TARGET_GROUP
resource "aws_lb_target_group" "nginx-tg" {
  name     = "altschool-alb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = module.vpc.vpc_id

  tags = local.common_tags
}


# AWS_LB_LISTENER
resource "aws_lb_listener" "nginx" {
  load_balancer_arn = aws_lb.nginx.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginx-tg.arn
  }

  tags = local.common_tags
}
# AWS_LB_TARGET_GROUP_ATTACHMENT 

resource "aws_lb_target_group_attachment" "nginx" {
  count            = var.instance_count
  target_group_arn = aws_lb_target_group.nginx-tg.arn
  target_id        = aws_instance.nginx[count.index].id
  port             = 80
}

