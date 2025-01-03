resource "aws_security_group" "mum_uat_ots_sg_ec2" {
  description = "Ots-Uat-SG"
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = null
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
  ]

  ingress = [
    {
      cidr_blocks = [
        "10.5.50.32/32",
      ]
      description      = "test-ots"
      from_port        = 82
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 82
    },
    {
      cidr_blocks = [
        "10.5.53.132/32",
      ]
      description      = "redis temp"
      from_port        = 6001
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 6001
    },
    {
      cidr_blocks = [
        "172.19.30.6/32",
      ]
      description      = ""
      from_port        = 81
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 81
    },
    {
      cidr_blocks = [
        "10.5.0.0/32",
      ]
      description      = "Kafka port"
      from_port        = 9092
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 9092
    },
    {
      cidr_blocks = [
        "10.5.50.0/24",
      ]
      description      = "HTTPS PORT FOR INTERNAL"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    },
    {
      cidr_blocks = [
        "10.5.50.0/24",
      ]
      description      = "UNKNOW PORT"
      from_port        = 3100
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 3100
    },
    {
      cidr_blocks = [
        "10.5.50.114/32",
      ]
      description      = "SSH PORT"
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks = [
        "10.5.53.132/32",
      ]
      description      = "rabin redis"
      from_port        = 6379
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 6379
    },
    {
      cidr_blocks = [
        "10.5.50.131/32",
      ]
      description      = "temp"
      from_port        = 8080
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 8080
    },
    {
      cidr_blocks = [
        "10.5.50.131/32",
      ]
      description      = "temp"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    },
    {
      cidr_blocks = [
        "10.5.50.32/32",
      ]
      description      = "Port for autopay-registry"
      from_port        = 8761
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 8761
    },
    {
      cidr_blocks = [
        "10.5.50.69/32",
      ]
      description      = "HTTP PORT FOR MIDDLEWARE"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    },
    {
      cidr_blocks = [
        "10.5.50.99/32",
      ]
      description      = "HTTP PORT FOR PAYNETZ"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    },
    {
      cidr_blocks = [
        "10.5.53.47/32",
        "10.5.53.132/32",
      ]
      description      = "ZABBIX AGENT PORT"
      from_port        = 10050
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 10050
    },
    {
      cidr_blocks = [
        "10.5.53.47/32",
        "10.5.53.132/32",
      ]
      description      = "ZABBIX JMX PORT"
      from_port        = 10053
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 10053
    },
    {
      cidr_blocks = [
        "10.5.53.47/32",
      ]
      description      = "Container monitor"
      from_port        = 8080
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 8080
    },
    {
      cidr_blocks = [
        "10.5.53.47/32",
      ]
      description      = "Node Exporter"
      from_port        = 9100
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 9100
    },
    {
      cidr_blocks = [
        "10.5.53.47/32",
      ]
      description      = "testing "
      from_port        = 81
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 81
    },
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = "testing "
      from_port        = 81
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 81
    },
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = "temp"
      from_port        = 5786
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 5786
    },
    {
      cidr_blocks = [
        "10.8.0.0/24",
      ]
      description      = "HTTP PORT FOR BANKIQ"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 443
    },
    {
      cidr_blocks = [
        "172.19.30.6/32",
      ]
      description      = "temp access "
      from_port        = 22
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 22
    },
    {
      cidr_blocks = [
        "172.19.30.6/32",
      ]
      description      = "HTTP PORT FOR ZSCALAR"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 80
    },
    {
      cidr_blocks      = []
      description      = "ALB SG"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        "sg-0396baae4a940ea3d",
      ]
      self    = false
      to_port = 80
    },
    {
      cidr_blocks      = []
      description      = "Paynetz-Uat-Alb-SG"
      from_port        = 81
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        "sg-017f962ae39b9c39d",
      ]
      self    = false
      to_port = 81
    },
    {
      cidr_blocks      = []
      description      = "Titan-Uat-SG"
      from_port        = 80
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        "sg-0807cfd96a8b8345c",
      ]
      self    = false
      to_port = 80
    },
  ]
  name        = "Ots-Uat-SG"
  name_prefix = null

  tags = {
    "Name" = "Ots-Uat-SG"
  }
  tags_all = {
    "Name" = "Ots-Uat-SG"
  }
  vpc_id = "vpc-0de4ef044c1079b59"
}
            
resource "aws_security_group" "mum_uat_ots_sg_alb" {
  
  description = "SG group for Ots Alb"
  egress = [
    {
      cidr_blocks = [
        "0.0.0.0/0",
      ]
      description      = null
      from_port        = 0
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "-1"
      security_groups  = []
      self             = false
      to_port          = 0
    },
  ]

  ingress = [
    {
      cidr_blocks = [
        "10.5.50.32/32",
      ]
      description      = "Port for pre-uat ots docker"
      from_port        = 81
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups  = []
      self             = false
      to_port          = 81
    },
    {
      cidr_blocks      = []
      description      = "Ots-Uat-Nlb-SG"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        "sg-0cee5a47ba257c67f",
      ]
      self    = false
      to_port = 443
    },
    {
      cidr_blocks      = []
      description      = "Paynetz-Uat-Alb-SG"
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = [
        "sg-017f962ae39b9c39d",
      ]
      self    = false
      to_port = 443
    },
    {
      cidr_blocks      = ["0.0.0.0/0"]
      description = ""
      from_port        = 443
      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      protocol         = "tcp"
      security_groups = []
      self    = false
      to_port = 443
    },
  ]
  name        = "Ots-Uat-Alb-SG"
  name_prefix = null

  tags = {
    "Name" = "Ots-Uat-Alb-SG"
  }
  tags_all = {
    "Name" = "Ots-Uat-Alb-SG"
  }
  vpc_id = "vpc-0de4ef044c1079b59"
  
}
