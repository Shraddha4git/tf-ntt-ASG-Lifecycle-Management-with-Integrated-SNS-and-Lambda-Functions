# region_environment_product/service_resource-name_unique-identifer
resource "aws_lb" "mum_uat_ots_alb_tf-test-asg-low-tg" {
  client_keep_alive                                            = 3600
  customer_owned_ipv4_pool                                     = null
  desync_mitigation_mode                                       = "defensive"
  drop_invalid_header_fields                                   = false
  enable_cross_zone_load_balancing                             = true
  enable_deletion_protection                                   = false
  enable_http2                                                 = true
  enable_tls_version_and_cipher_suite_headers                  = false
  enable_waf_fail_open                                         = false
  enable_xff_client_port                                       = false
  enable_zonal_shift                                           = false
  enforce_security_group_inbound_rules_on_private_link_traffic = null
  idle_timeout                                                 = 60
  internal                                                     = true
  ip_address_type                                              = "ipv4"
  load_balancer_type                                           = "application"
  name                                                         = "tf-test-asg-low-tg"
  name_prefix                                                  = null
  preserve_host_header                                         = false
  security_groups = [
    "sg-0396baae4a940ea3d",
  ]
  subnets = [
    "subnet-0239236d7ae0e3b9c",
    "subnet-0834998db8aab5768",
  ]
  tags     = {}
  tags_all = {}
}

resource "aws_lb_listener" "mum_uat_ots_listener_asg-low-tg" {
  #load_balancer_arn = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:loadbalancer/app/scripting-alb-test/d3eb65baab10a3b0"
  load_balancer_arn = aws_lb.mum_uat_ots_alb_tf-test-asg-low-tg.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  tags              = {}
  tags_all          = {}

  default_action {
    target_group_arn = null
    type             = "forward"

    forward {
      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:targetgroup/tf-asg-low-tg2/dec3cbcdf6ad37d4"
        weight = 100
      }
      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:targetgroup/tf-asg-tg1/6e886774c829f914"
        weight = 0
      }
    }
  }

  mutual_authentication {
    ignore_client_certificate_expiry = false
    mode                             = "off"
    trust_store_arn                  = null
  }
  certificate_arn = "arn:aws:acm:ap-south-1:389531784675:certificate/08ff9a5c-7a07-4b98-ae55-594a4f529e37"
}

resource "aws_lb_listener_rule" "mum_uat_ots_lr_scriptingtest_01" {
  listener_arn = aws_lb_listener.mum_uat_ots_listener_asg-low-tg.arn
  priority     = 2
  tags = {
    "Name" = ""
  }
  tags_all = {
    "Name" = ""
  }
  action {
    # order            = 0
    target_group_arn = null
    type             = "forward"
    forward {
      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:targetgroup/tf-asg-low-tg2/dec3cbcdf6ad37d4"
        weight = 100
      }
      target_group {
        arn    = "arn:aws:elasticloadbalancing:ap-south-1:389531784675:targetgroup/tf-asg-tg1/6e886774c829f914"
        weight = 0
      }
    }
  }
  condition {
    query_string {
      key   = "login"
      value = "7"
    }
    query_string {
      key   = "merchId"
      value = "7"
    }
  }
}