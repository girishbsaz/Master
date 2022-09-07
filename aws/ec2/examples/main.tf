terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.70.0"
    }
  }
  required_version = ">= 1.0.9"
}

provider "aws" {
  region = "eu-west-1"
}

module "ec2" {
  source                     = "../"
  environment                = var.environment
  project                    = var.project
  business_unit              = var.business_unit
  owner                      = var.owner
  operational_company        = var.operational_company
  technical_owner            = var.technical_owner
  aws_subnet_id              = var.aws_subnet_id
  aws_security_group_id      = var.aws_security_group_id
  aws_instance_type          = var.aws_instance_type
  aws_ami_owner              = var.aws_ami_owner
  aws_ami_name_regex         = var.aws_ami_name_regex
  aws_ami_tags               = var.aws_ami_tags
  aws_instance_key_name      = var.aws_instance_key_name
  aws_kms_key_arn            = var.aws_kms_key_arn
  aws_secondary_volume_count = var.aws_secondary_volume_count
  aws_secondary_volume_size  = var.aws_secondary_volume_size
  aws_secondary_volume_type  = var.aws_secondary_volume_type
  aws_ebs_device_name        = var.aws_ebs_device_name
  location_code              = var.location_code
  client_code                = var.client_code
  device_role                = var.device_role
  environment_code           = var.environment_code
  aws_ec2_instance_sequence  = var.aws_ec2_instance_sequence
  aws_instance_profile_name  = var.aws_instance_profile_name
  aws_root_volume_size       = var.aws_root_volume_size
  aws_root_volume_type       = var.aws_root_volume_type
  aws_ami_name               = var.aws_ami_name
  user_data = "script.sh" #Optional
}
