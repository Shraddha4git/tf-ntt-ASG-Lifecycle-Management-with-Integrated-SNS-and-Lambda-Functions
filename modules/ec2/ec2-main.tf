# region_environment_product/service_resource-name_unique-identifer
resource "aws_instance" "aws_uat_ots_ec2_scriptingtest_01" {
  ami = "ami-0dd0b3424248d3ced"
  #arn                                  = "arn:aws:ec2:ap-south-1:389531784675:instance/i-04dbe35232c8a86e3"
  associate_public_ip_address = false
  availability_zone           = "ap-south-1b"
  disable_api_stop            = false
  disable_api_termination     = false
  ebs_optimized               = true
  get_password_data           = false
  hibernation                 = false
  host_id                     = null
  iam_instance_profile        = "Script_Role"
  #id                                   = "i-04dbe35232c8a86e3"
  instance_initiated_shutdown_behavior = "stop"
  instance_lifecycle                   = null
  #instance_state                       = "stopped"
  instance_type = "t3a.xlarge"
  #ipv6_address_count                   = 0
  ipv6_addresses             = []
  key_name                   = "atomuat_1"
  monitoring                 = false
  outpost_arn                = null
  password_data              = null
  placement_group            = null
  placement_partition_number = 0
  #primary_network_interface_id         = "eni-0873f1b2c30143561"
  #private_dns                          = "ip-10-5-50-178.ap-south-1.compute.internal"
  private_ip               = "10.5.50.178"
  public_dns               = null
  public_ip                = null
  secondary_private_ips    = []
  security_groups          = []
  source_dest_check        = true
  spot_instance_request_id = null
  subnet_id                = "subnet-0834998db8aab5768"
  tags = {
    "CreatedBy"   = "Sanjeev"
    "Environment" = "UAT"
    "Name"        = "Script-OTS-test01"
    "Owner"       = "Sanjeev"
    "Product"     = "OTS"
    "Role"        = "TEST"
  }
  tags_all = {
    "CreatedBy"   = "Sanjeev"
    "Environment" = "UAT"
    "Name"        = "Script-OTS-test01"
    "Owner"       = "Sanjeev"
    "Product"     = "OTS"
    "Role"        = "TEST"
  }
  tenancy = "default"
  vpc_security_group_ids = [
    "sg-066fbce019e86e6c7",
  ]

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    amd_sev_snp      = null
    core_count       = 2
    threads_per_core = 2
  }

  credit_specification {
    cpu_credits = "standard"
  }

  enclave_options {
    enabled = false
  }

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = true
    #device_name           = "/dev/sda1"
    encrypted  = false
    iops       = 3000
    kms_key_id = null
    tags       = {}
    tags_all   = {}
    throughput = 125
    #volume_id             = "vol-089afb277b79553cc"
    volume_size = 50
    volume_type = "gp3"
  }
}

resource "aws_instance" "aws_uat_ots_ec2_scriptingtest_02" {
  ami = "ami-07b1d48952ec332ea"
  #arn                                  = "arn:aws:ec2:ap-south-1:389531784675:instance/i-08783c9582288086f"
  associate_public_ip_address = false
  availability_zone           = "ap-south-1b"
  disable_api_stop            = false
  disable_api_termination     = false
  ebs_optimized               = true
  get_password_data           = false
  hibernation                 = false
  host_id                     = null
  iam_instance_profile        = "Script_Role"
  #id                                   = "i-08783c9582288086f"
  instance_initiated_shutdown_behavior = "stop"
  instance_lifecycle                   = null
  #instance_state                       = "stopped"
  instance_type = "t3a.large"
  #ipv6_address_count                   = 0
  ipv6_addresses             = []
  key_name                   = "atomuat_1"
  monitoring                 = false
  outpost_arn                = null
  password_data              = null
  placement_group            = null
  placement_partition_number = 0
  # primary_network_interface_id         = "eni-09aa234afd26872a4"
  #private_dns                          = "ip-10-5-50-200.ap-south-1.compute.internal"
  #private_ip                           = "10.5.50.200"
  public_dns               = null
  public_ip                = null
  secondary_private_ips    = []
  security_groups          = []
  source_dest_check        = true
  spot_instance_request_id = null
  subnet_id                = "subnet-0834998db8aab5768"
  tags = {
    "CreatedBy"   = "Sanjeev"
    "Environment" = "UAT"
    "Name"        = "Script-OTS-test02"
    "Owner"       = "Sanjeev"
    "Product"     = "OTS"
    "Role"        = "TEST"
  }
  tags_all = {
    "CreatedBy"   = "Sanjeev"
    "Environment" = "UAT"
    "Name"        = "Script-OTS-test02"
    "Owner"       = "Sanjeev"
    "Product"     = "OTS"
    "Role"        = "TEST"
  }
  tenancy = "default"
  vpc_security_group_ids = [
    "sg-066fbce019e86e6c7",
  ]

  capacity_reservation_specification {
    capacity_reservation_preference = "open"
  }

  cpu_options {
    amd_sev_snp      = null
    core_count       = 1
    threads_per_core = 2
  }

  credit_specification {
    cpu_credits = "unlimited"
  }

  enclave_options {
    enabled = false
  }

  maintenance_options {
    auto_recovery = "default"
  }

  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "optional"
    instance_metadata_tags      = "disabled"
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = false
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = true
    #device_name           = "/dev/sda1"
    encrypted  = false
    iops       = 3000
    kms_key_id = null
    tags       = {}
    tags_all   = {}
    throughput = 125
    #volume_id             = "vol-02d3d7c52e013d537"
    volume_size = 50
    volume_type = "gp3"
  }
}

resource "aws_ebs_volume" "aws_uat_ots_ebsv_01_ec2_scriptingtest_01" {
  #arn                  = "arn:aws:ec2:ap-south-1:389531784675:volume/vol-089afb277b79553cc"
  availability_zone = "ap-south-1b"
  encrypted         = false
  #id                   = "vol-089afb277b79553cc"
  iops                 = 3000
  kms_key_id           = null
  multi_attach_enabled = false
  outpost_arn          = null
  size                 = 50
  snapshot_id          = "snap-05356ac21a9ae923f"
  tags                 = {}
  tags_all             = {}
  throughput           = 125
  type                 = "gp3"
}

resource "aws_ebs_volume" "aws_uat_ots_ebsv_01_ec2_scriptingtest_02" {
  #arn                  = "arn:aws:ec2:ap-south-1:389531784675:volume/vol-02d3d7c52e013d537"
  availability_zone = "ap-south-1b"
  encrypted         = false
  #id                   = "vol-02d3d7c52e013d537"
  iops                 = 3000
  kms_key_id           = null
  multi_attach_enabled = false
  outpost_arn          = null
  size                 = 50
  snapshot_id          = "snap-00e6d37d9c865b7ca"
  tags                 = {}
  tags_all             = {}
  throughput           = 125
  type                 = "gp3"
}

resource "aws_lb_target_group_attachment" "tg1_attachment_01" {
  target_group_arn = var.tf_asg_tg1-arn
  target_id        = aws_instance.aws_uat_ots_ec2_scriptingtest_01.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "tg1_attachment_02" {
  target_group_arn = var.tf_asg_tg1-arn
  target_id        = aws_instance.aws_uat_ots_ec2_scriptingtest_02.id
  port             = 80
}

variable "tf_asg_tg1-arn" {
  
}

/*
variable "tg1_arn" {
  
}
variable "tg2_arn" {
  
}*/
