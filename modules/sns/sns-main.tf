resource "aws_sns_topic" "tf-asg-low-tg-sns_topic" {
  name = "tf-asg-low-tg-lifecycle-topic"
}

resource "aws_sns_topic_subscription" "tf-asg-low-tg-sns-lambda-sub" {
  topic_arn = aws_sns_topic.tf-asg-low-tg-sns_topic.arn
  protocol  = "lambda"
  endpoint  = var.AsgTerminationLowTg-lambda-arn
}

variable "AsgTerminationLowTg-lambda-arn" { 
}

output "tf-asg-low-tg-sns-topic-arn" {
  value = aws_sns_topic.tf-asg-low-tg-sns_topic.arn
}