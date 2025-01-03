resource "aws_lb_target_group" "tf-asg-tg1" {
  name     = "tf-asg-tg1"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0de4ef044c1079b59"
}

resource "aws_lb_target_group" "tf-asg-low-tg2" {
  name     = "tf-asg-low-tg2"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "vpc-0de4ef044c1079b59"
}
