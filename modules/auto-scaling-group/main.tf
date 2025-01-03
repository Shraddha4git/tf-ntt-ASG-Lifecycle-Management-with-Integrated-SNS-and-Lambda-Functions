resource "aws_iam_policy" "tf_asg_low_tg_lifecycle_policy" {
  name        = "tfasglowtglifecyclepolicy"
  description = "Policy to allow lifecycle hooks to publish to SNS"

  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Action = "sns:Publish",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role" "tf_asg_low_tg_lifecycle_role" {
  name = "tf-asg-low-tg-lifecycle-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Service = ["autoscaling.amazonaws.com","lambda.amazonaws.com"]
        },
        Action = "sts:AssumeRole"
      }
    ]
  })
}
/*
resource "aws_iam_role_policy_attachment" "lifecycle_role_policy_attachment" {
  role       = aws_iam_role.tf_asg_low_tg_lifecycle_role.arn
  policy_arn = aws_iam_policy.tf_asg_low_tg_lifecycle_policy.arn
}
*/
resource "aws_autoscaling_group" "tf-low_cost_asg-import" {
  name                      = "tf-low-cost-asg"
  #availability_zones        = ["ap-south-1b"]
  desired_capacity          = 0
  max_size                  = 0
  min_size                  = 0
  health_check_grace_period = 300
  health_check_type         = "EC2"
  metrics_granularity       = "1Minute"
  default_cooldown          = 300
  service_linked_role_arn   = "arn:aws:iam::389531784675:role/aws-service-role/autoscaling.amazonaws.com/AWSServiceRoleForAutoScaling"
  #vpc_zone_identifier       = ["subnet-0834998db8aab5768"]
  target_group_arns         = ["arn:aws:elasticloadbalancing:ap-south-1:389531784675:targetgroup/tf-asg-low-tg2/dec3cbcdf6ad37d4"]
  termination_policies = ["OldestInstance"]
  launch_template {
    id      = "lt-076ee304f2d461478"
    version = "$Latest"
  }

  tag {
    key                 = "Owner"
    value               = "Shraddha"
    propagate_at_launch = true
  }

  tag {
    key                 = "Purpose"
    value               = "TF POC"
    propagate_at_launch = true
  }

  lifecycle {
    ignore_changes = [
     force_delete, 
     force_delete_warm_pool, 
     ignore_failed_scaling_activities, 
     wait_for_capacity_timeout, 
     wait_for_elb_capacity, 
     timeouts, 
     warm_pool
    ]
  }
}
/*
resource "aws_autoscaling_schedule" "tf-low_cost_asg-scale_up" {
  scheduled_action_name  = "tf-low_cost_asg-scale-up-evening"
  autoscaling_group_name = aws_autoscaling_group.tf-low_cost_asg-import.name
  min_size               = 1
  max_size               = 4
  desired_capacity       = 1
  recurrence             = "0 12 * * *"  # At 06:00 PM UTC (12:00 PM UTC) - Corresponds to 6:00 PM IST
}

resource "aws_autoscaling_schedule" "tf-low_cost_asg-scale_down" {
  scheduled_action_name  = "tf-low_cost_asg-scale-down-morning"
  autoscaling_group_name = aws_autoscaling_group.tf-low_cost_asg-import.name
  min_size               = 0
  max_size               = 1
  desired_capacity       = 0
  recurrence             = "30 0 * * *"  # At 06:00 AM UTC (00:30 AM UTC) - Corresponds to 6:00 AM IST
}
*/

resource "aws_autoscaling_lifecycle_hook" "terminate_hook" {
  name                   = "tf-test-TerminateHook"
  autoscaling_group_name = aws_autoscaling_group.tf-low_cost_asg-import.name
  lifecycle_transition   = "autoscaling:EC2_INSTANCE_TERMINATING"
  heartbeat_timeout      = 3600
  default_result         = "CONTINUE"
  notification_target_arn = var.tf-asg-low-tg-sns-topic-arn
  role_arn                = aws_iam_role.tf_asg_low_tg_lifecycle_role.arn   
}

variable "tf-asg-low-tg-sns-topic-arn" {
  
}


output "tf_asg_low_tg_lifecycle_role_arn" {
  value = aws_iam_role.tf_asg_low_tg_lifecycle_role.arn
}
/*
data "aws_autoscaling_group" "asg" {
  name = aws_autoscaling_group.tf-low_cost_asg-import.name
}
data "aws_instances" "asg_instances" {
  filter {
    name   = "tag:aws:autoscaling:groupName"
    values = [data.aws_autoscaling_group.asg.name]
  }
}
output "tf-low-tg-asg_instance_ids" {
  value = data.aws_instances.asg_instances.ids
}*/

