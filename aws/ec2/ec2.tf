#-------------------------
# Pre-existing Subnet Data 
#-------------------------

data "aws_subnet" "aws_subnet_data" {
  id = var.aws_subnet_id
}

#-----------------------------
# Filter Pre-existing AMI Data 
#-----------------------------

data "aws_ami" "aws_ami_data" {
  most_recent = true
  name_regex  = var.aws_ami_name_regex
  owners      = ["${var.aws_ami_owner}"]

  filter {
    name   = "name"
    values = ["${var.aws_ami_name}"]
  }

  dynamic "filter" {
    for_each = var.aws_ami_tags
    iterator = tag
    content {
      name   = "tag:${tag.key}"
      values = [tag.value]
    }
  }
}

#----------------------------------------
# Creation of an EC2 instance from an AMI 
#----------------------------------------

resource "aws_instance" "aws_ec2_instance" {

  ami                         = data.aws_ami.aws_ami_data.id
  instance_type               = var.aws_instance_type
  availability_zone           = local.availability_zone
  subnet_id                   = var.aws_subnet_id
  associate_public_ip_address = false
  key_name                    = var.aws_instance_key_name
  iam_instance_profile        = var.aws_instance_profile_name
  vpc_security_group_ids      = [var.aws_security_group_id]
  user_data = var.user_data != null ?  filebase64("${var.user_data}") : null

  root_block_device {
  delete_on_termination = var.should_delete_volume_on_termination
  volume_size           = var.aws_root_volume_size
  volume_type           = var.aws_root_volume_type
  encrypted             = true
  kms_key_id            = var.aws_kms_key_arn

  tags = merge(
    local.common_tags,
    {
      Name        = "os-dsk-${local.ec2_instance_name}-1",
      Description = "A Root (OS) Volume with a size of ${var.aws_root_volume_size}GiB and of type ${var.aws_root_volume_type} with encryption."
    }
  )

  }

  tags = merge(
    local.common_tags,
    {
      Name        = local.ec2_instance_name
      Description = "For hosting ${var.project} application."
    }
  )
  lifecycle {
    ignore_changes = [user_data]
  }
}

#------------------------------------------------------
# Creation of an Secondary EBS Volumes for the Instance 
#------------------------------------------------------

resource "aws_ebs_volume" "aws_ebs_volume" {
  count             = local.volume_count
  availability_zone = local.availability_zone
  size              = var.aws_secondary_volume_size
  type              = var.aws_secondary_volume_type
  encrypted         = var.is_secondary_volume_encrypted
  kms_key_id        = var.aws_kms_key_arn

  tags = merge(
    local.common_tags,
    {
      Name        = "data-dsk-${local.ec2_instance_name}-${count.index + 1}",
      Description = "An EBS Block Volume with a size of ${var.aws_secondary_volume_size}GiB and of type ${var.aws_secondary_volume_type} with encryption being ${var.is_secondary_volume_encrypted}."
    }
  )
}

#------------------------------------------
# Attachment of EBS Volumes to the Instance 
#------------------------------------------

resource "aws_volume_attachment" "aws_ec2_volume_attachment" {
  count       = local.volume_count
  device_name = var.aws_ebs_device_name[count.index]
  volume_id   = aws_ebs_volume.aws_ebs_volume.*.id[count.index]
  instance_id = join("", aws_instance.aws_ec2_instance.*.id)
}
