# Setting aws region
# I can pick up the AWS user credentials from your environment.
provider "aws" {
  region = "us-east-1"
}
# Reading user-data
resource "template_file" "userdata01" {
    filename = "bootstrap.sh"
}

# Security group for ASG 
resource "aws_security_group" "sg" {
  name = "elastic_ninja-sg"
  description = "Allow all inbound traffic"
  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 9200
      to_port = 9200
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port = 5601
      to_port = 5601
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

# Launch Config
resource "aws_launch_configuration" "launch_configuration" {
    name_prefix = "config1-elastic-ninja"
    image_id = "ami-49c9295f"
    instance_type = "t1.micro"
    security_groups = [ "${aws_security_group.sg.id}" ]
    root_block_device {
       volume_size = "120"
       volume_type = "gp2"
       delete_on_termination = "true"
    }
    user_data = "${template_file.userdata01.rendered}"
    lifecycle {
      create_before_destroy = true
    }
}

# Autoscale
resource "aws_autoscaling_group" "autoscaling_group" {
    name = "scale-elastic-ninja"
    desired_capacity = 1
    min_size = 1
    max_size = 1
    health_check_type = "EC2"
    health_check_grace_period = 600
    termination_policies = [ "OldestInstance" ]
    launch_configuration = "${aws_launch_configuration.launch_configuration.name}"
    tag {
      key = "Name"
      value = "Elastic-Ninja"
      propagate_at_launch = true
    }
    lifecycle {
      create_before_destroy = true
    }
}
