
data "aws_iam_role" "Script_Role" {
  name = "Script_Role"
}

resource "aws_iam_instance_profile" "low-cost-ec2-profile-ots-test" {
  name = "low-cost-ec2-profile-ots-test"
  role = data.aws_iam_role.Script_Role.name
}

resource "aws_launch_template" "ec2-lowcost-launch_template" {
  name = "tf-ec2-lowcost-launch-template"
  iam_instance_profile { 
    #name = aws_iam_instance_profile.low-cost-ec2-profile-ots-test.name 
    #name = data.aws_iam_instance_profile.low_cost_ec2_profile_ots_test.name
    name = "low-cost-ec2-profile-ots-test"
    }
  #security_group_names = [ "sg-066fbce019e86e6c7" ]
  vpc_security_group_ids = ["sg-066fbce019e86e6c7" ]
  image_id        = "ami-074881ea9a5b2fe13" # updated with log rotation script #"ami-0dd0b3424248d3ced" # incorrect - no webapps
  instance_type   = "t3a.large"
  key_name        = "atomuat_1"
  tag_specifications { 
    resource_type = "instance" 
    tags = { 
        Name = "tf-LowCostInstance" 
        Environment = "UAT"
        Role = "TF-TEST"
        CreatedBy = "Shraddha" 
        } 
    }
   lifecycle { 
    create_before_destroy = true 
 }
}

output "iam_instance_profile_name"{
    value = aws_iam_instance_profile.low-cost-ec2-profile-ots-test.name
}
output "low-cost-launch_template-id" {
  value = aws_launch_template.ec2-lowcost-launch_template.id
}