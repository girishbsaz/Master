<!-- BEGIN_TF_DOCS -->

# AWS EC2

Configuration in this directory creates an EC2 instance with Encrypted Volumes using KMS

## Modules Usage 

Following example to create an EC2 instance with Encrypted Volumes using KMS


### `main.tf`
```hcl

module "ec2" {
  source                     = "../"
  environment                = var.environment
  project                    = var.project
  business_unit              = var.business_unit
  owner                      = var.owner
  operational_company        = var.operational_company
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
  aws_root_volume_size = var.aws_root_volume_size
  aws_root_volume_type = var.aws_root_volume_type
  aws_ami_name         = var.aws_ami_name
}
```
## `variables.auto.tfvars`
```hcl
environment       = "test"
business_unit     = "POC"
owner             = "owner@example.com"
project           = "POC"
aws_instance_type = "t2.micro"
aws_ami_owner     = "xxxxx"
aws_ami_name      = "aws-rhel*"
aws_ami_tags      = {
    "Application" = "base",
    "OS"          = "Linux",
    "OS_Version"  = "8.4",
    "Runner"      = "EC2"
}
aws_instance_key_name         = "RHEL-packer"
aws_ami_name_regex            = "aws-rhel*"
aws_kms_key_arn               = "arn:aws:kms:eu-west-1:xxxx:key/xxx-xxxx-xxx-xxxx-xxxxxx"
aws_subnet_id                 = "subnet-xxxxxxxx"
is_secondary_volume_encrypted = true
aws_secondary_volume_count    = 2
aws_security_group_id         = "sg-xxxxx"
aws_root_volume_size          = "20"
aws_root_volume_type          = "gp2"
aws_instance_profile_name     = "AmazonSSMRoleForInstancesQuickSetup"
aws_ebs_device_name           = ["/dev/xvdb", "/dev/xvdc", "/dev/xvdd", "/dev/xvde", "/dev/xvdf", "/dev/xvdg", "/dev/xvdh", "/dev/xvdi", "/dev/xvdj", "/dev/xvdk", "/dev/xvdl", "/dev/xvdm", "/dev/xvdn", "/dev/xvdo", "/dev/xvdp", "/dev/xvdq", "/dev/xvdr", "/dev/xvds", "/dev/xvdt", "/dev/xvdu", "/dev/xvdv", "/dev/xvdw", "/dev/xvdx", "/dev/xvdy", "/dev/xvdz"]

aws_ec2_instance_sequence = "009"
location_code             = "T"
client_code               = "C"
device_role               = "D"
environment_code          = "E"
aws_secondary_volume_size = 8
aws_secondary_volume_type = "gp2"
operational_company       = "test"

```

## Terraform Usage

To run this example you need to execute following Terraform commands

```hcl
terraform init
terraform plan
terraform apply
```

Run `terraform destroy` when you don't need these resources.

## Outputs

```
#---------------------------
# New EC2 Instance ID output
#---------------------------

output "aws_ec2_instance_id_output" {
  description = "ID of newly created EC2 instance."
  value = aws_instance.aws_ec2_instance.id
}
```
<!-- END_TF_DOCS -->


