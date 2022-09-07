provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "linux" {
  ami                         = var.ami_id
  subnet_id                   = var.subnet_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  security_groups             = [var.security_group_id]
  key_name                    = var.key_name

  tags = {
    Name = "linux-an-tf-integration"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Wait until SSH is ready'"
    ]

    connection {
      type        = "ssh"
      user        = var.instance_user
      private_key = file("${var.private_key_path}")
      host        = aws_instance.linux.public_ip
      script_path = "/home/${var.instance_user}/terraform_provisioner_%RAND%.sh"
    }
  }

  provisioner "local-exec" {
  //  working_dir = "./ansible/"
    environment = { 
      ANSIBLE_ROLES_PATH = "/home/ec2-user/maf/iac-ansible-fireeye/roles/:/home/ec2-user/maf/iac-ansible-bmc/roles/"
      ANSIBLE_HOST_KEY_CHECKING = false
    }
    command = "ansible-playbook -i ${aws_instance.linux.public_ip}, --private-key ${var.private_key_path} ansible/server.yml --vault-password-file=./ansible/.vault.txt -u ${var.instance_user}"
  }
}
