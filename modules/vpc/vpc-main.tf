#region_environment_product/service_resource-name_unique-identifer
resource "aws_vpc" "mum_uat_ots_vpc_10-5" {
  cidr_block = "10.5.0.0/16"
    assign_generated_ipv6_cidr_block = false
  enable_dns_hostnames                 = true
  enable_dns_support                   = true
  enable_network_address_usage_metrics = false
  instance_tenancy                     = "default"
  ipv6_association_id                  = null
  ipv6_cidr_block                      = null
  ipv6_cidr_block_network_border_group = null
  ipv6_ipam_pool_id                    = null
  tags = {
    "Approved By " = "Mayur Chandekar"
    "Created By"   = "Sarang Kulkarni"
    "Name"         = "NDPS_UAT_10.5.x.x"
    "Purpose"      = "Prod-Replica"
  }
}
resource "aws_subnet" "mum_uat_ots_subnet_segA" {
  assign_ipv6_address_on_creation                = false
  cidr_block                                     = "10.5.50.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_cidr_block_association_id                 = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    "Name" = "Ndps_UAT_SegA"
  }
  tags_all = {
    "Name" = "Ndps_UAT_SegA"
  }
  vpc_id = "vpc-0de4ef044c1079b59"
}

resource "aws_subnet" "mum_uat_ots_subnet_segE" {
  assign_ipv6_address_on_creation                = false
  availability_zone                              = "ap-south-1a"
  cidr_block                                     = "10.5.70.0/24"
  customer_owned_ipv4_pool                       = null
  enable_dns64                                   = false
  enable_resource_name_dns_a_record_on_launch    = false
  enable_resource_name_dns_aaaa_record_on_launch = false
  ipv6_cidr_block                                = null
  ipv6_cidr_block_association_id                 = null
  ipv6_native                                    = false
  map_public_ip_on_launch                        = false
  outpost_arn                                    = null
  private_dns_hostname_type_on_launch            = "ip-name"
  tags = {
    "Name" = "Ndps_UAT_SegE"
  }
  tags_all = {
    "Name" = "Ndps_UAT_SegE"
  }
  vpc_id = "vpc-0de4ef044c1079b59"
}

