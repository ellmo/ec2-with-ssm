provider "aws" {
  #   If not set explicitly, following values are taken from ~/.aws/config and ~/.aws/credentials.
  # The script will look for [default] profile and
  #
  # region = "eu-central-1"
  # access_key =
  # secret_key =
}

# Variable used for naming of all the related resource
variable "resource_name" {
  type        = string
  description = "Common naming scheme for created resources"
  # set a default value if you don't want to pass it manually
  #
  # default = "ec2_with_ssm_template"
}

# All the role/permission making delegated to a separate module.
module "iam_module" {
  source        = "./iam"
  resource_name = var.resource_name
}

module "ec2_module" {
  source                    = "./ec2"
  resource_name             = var.resource_name
  #   An EC2 instance requires an attached "instance profile", to permit SSM connections.
  # Funnily enough, it requires its NAME, not ARN (universal resource identifier).
  #
  #   This is the whole reason why the IAM module exists and returns a proper profile
  # which we pass into the EC2 module.
  ssm_instance_profile_name = module.iam_module.ssm_instance_profile_name
}
