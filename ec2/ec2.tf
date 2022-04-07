variable "resource_name" {
  type = string
}

variable "ssm_instance_profile_name" {
  type = string
}

resource "aws_instance" "ec2" {
  #   This template hardcodes the following OS image: "ami-0dcc0ebde7b2e00db",
  # which corresponds to:
  # Amazon Linux 2 AMI (HVM) - Kernel 5.10, SSD Volume Type (64bit x86)
  #
  #   To browse available AMIs, log into AWS, go to EC2 > Instances > Launch Instances
  ami           = "ami-0dcc0ebde7b2e00db"
  instance_type = "t2.micro"

  iam_instance_profile  = var.ssm_instance_profile_name

  tags = {
    "Name" = "${var.resource_name} EC2"
  }
}
