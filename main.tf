module "vpc" {
  source = "./modules/vpc"
}
module "security_group" {
  source = "./modules/security_group"
}
module "target_groups" {
  source = "./modules/target_groups"
}
module "ec2" {
  source = "./modules/ec2"
  tf_asg_tg1-arn = module.target_groups.tf_asg_tg1-arn
}
module "key_pairs" {
  source = "./modules/key_pairs"
}
module "alb" {
  source = "./modules/alb"
}
module "ec2-lowcost-template" {
  source = "./modules/ec2-lowcost-template"
}

module "auto-scaling-group" {
  source = "./modules/auto-scaling-group"
  tf-asg-low-tg-sns-topic-arn = module.sns.tf-asg-low-tg-sns-topic-arn

}

module "lambda-functions" {
  source = "./modules/lambda-functions"
  #tf_low_tg_asg_instance_ids = module.auto-scaling-group.tf-low-tg-asg_instance_ids
  #tf_asg_low_tg_lifecycle_role_arn = module.auto-scaling-group.tf_asg_low_tg_lifecycle_role_arn  
  tf-asg-low-tg-sns-topic-arn = module.sns.tf-asg-low-tg-sns-topic-arn
}

module "sns" {
  source = "./modules/sns"
  AsgTerminationLowTg-lambda-arn = module.lambda-functions.AsgTerminationLowTg-lambda-arn
}

/*


import {
  id = "tf-low_cost_asg"
  to = module.auto-scaling-group.aws_autoscaling_group.tf-low_cost_asg-import
}
*/

/*

module "sns" {
  source = "./modules/sns"
}
module "s3" {
  source = "./modules/s3"
}
module "state-machine" {
  source = "./modules/state-machine"
}
module "lambda-functions" {
  source                         = "./modules/lambda-functions"
  depends_on                     = [module.s3, module.ec2]
  listener_arn                   = module.alb.listener_arn
  tg1_arn                        = module.target_groups.tg1_arn
  tg2_arn                        = module.target_groups.tg2_arn
  tg1_instance_ids               = var.tg1_instance_ids
  tg2_instance_ids               = var.tg2_instance_ids
  ec2_security_group_id          = module.security_group.ec2_security_group_id
  SNS_TOPIC_ARN                  = module.sns.SNS_TOPIC_ARN
  private_subnet_ids             = module.vpc.private_subnet_ids
  s3_bucket_name_lambda_registry = module.s3.s3_bucket_name_lambda_registry
}
import {
  id = "arn:aws:s3:::tf-poc-ots-logs"
  to = module.s3.aws_s3_bucket.s3_lambda_function_files
}

terraform import module.s3.aws_s3_bucket.s3_lambda_function_files arn:aws:s3:::tf-poc-ots-logs
# region_environment_product/service_resource-name_unique-identifer

import {
  id = ""
  to = module.sns.aws_sns_topic_policy.my_notification_topic_policy
}

import {
  id = "arn:aws:sns:ap-south-1:389531784675:tf-poc-ots-notification:7053cfaf-e978-43d7-96fb-e435e930d6c6"
  to = module.sns.aws_sns_topic_subscription.email_subscription
}

terraform import module.sns.aws_sns_topic_subscription.email_subscription arn:aws:sns:ap-south-1:389531784675:tf-poc-ots-notification:7053cfaf-e978-43d7-96fb-e435e930d6c6
aws_sns_topic_subscription.example arn:aws:sns:us-west-2:123456789012:example-topic:example-subscription

import {
  id = "arn:aws:sns:ap-south-1:389531784675:tf-poc-ots-notification"
  to = module.sns.aws_sns_topic.tf-poc-ots-notification
}
import {
  id = 
  to = module.sns.aws_sns_topic_policy.my_notification_topic_policy
}

import {
  id = 
  to = module.step-functions.aws_s3_bucket.s3_lambda_function_files
}



/*
import {
  id = "atomuat_1"
  to = module.key_pairs.aws_key_pair.mum_uat_ots_atomuat_1
}
import {
  id = "vol-02d3d7c52e013d537"
  to = module.ec2.aws_ebs_volume.aws_uat_ots_ebsv_01_ec2_scriptingtest_02
}
import {
  id = "i-08783c9582288086f"
  to = module.ec2.aws_instance.aws_uat_ots_ec2_scriptingtest_02
}
import {
  id = "vol-089afb277b79553cc"
  to = module.ec2.aws_ebs_volume.aws_uat_ots_ebsv_01_ec2_scriptingtest_01
}

import {
  id = "i-04dbe35232c8a86e3"
  to = module.ec2.aws_instance.aws_uat_ots_ec2_scriptingtest_01
}

import {
  id = "subnet-0834998db8aab5768"
  to = module.vpc.aws_subnet.mum_uat_ots_subnet_segA
}

import {
  id = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:listener-rule/app/scripting-alb-test/d3eb65baab10a3b0/33483eaafa8df1e0/4cf69c062cca761e"
  to = module.alb.aws_lb_listener_rule.mum_uat_ots_lr_scriptingtest_default_02
}
import {
  id = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:listener-rule/app/scripting-alb-test/d3eb65baab10a3b0/33483eaafa8df1e0/391d18a597d4a942"
  to = module.alb.aws_lb_listener_rule.mum_uat_ots_lr_scriptingtest_01
}
import {
  id = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:listener/app/scripting-alb-test/d3eb65baab10a3b0/33483eaafa8df1e0"
  to = module.alb.aws_lb_listener.mum_uat_ots_listener_scriptingtest
}


import {
  id = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:targetgroup/Scrpit-01-Test1/6138b950f043ef85"
  to = module.target_groups.aws_lb_target_group.mum_uat_ots_tg_scriptingtest_01
}
import {
  id = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:targetgroup/Scrpit-02-Test1/df43e7de137d698a"
  to = module.target_groups.aws_lb_target_group.mum_uat_ots_tg_scriptingtest_02
}



import {
  id = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:loadbalancer/app/scripting-alb-test/d3eb65baab10a3b0"
  to = module.alb.aws_lb.mum_uat_ots_alb_scriptingtest
}

#alb-sg
import {
  id = "sg-0396baae4a940ea3d"
  to = module.security_group.aws_security_group.mum_uat_ots_sg_alb
}

#ec2-sg
import {
  id = "sg-066fbce019e86e6c7"
  to = module.security_group.aws_security_group.mum_uat_ots_sg_ec2
}


/*
import {
  id = "subnet-0834998db8aab5768"
  to = module.vpc.aws_subnet.mum_uat_ots_subnet_segA
}



module "alb" {
  source = "./modules/alb"
}*/
