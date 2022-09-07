provider "aws" {
  region = "eu-west-1"
}

resource "aws_instance" "windows_2019" {
  ami           = var.ami_id
  instance_type = var.instance_type
  associate_public_ip_address = true
  subnet_id = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]
  tags = {
    Name = "windows-2019-an-tf-integration"
  }

  user_data = <<EOF
<powershell>
$admin = [adsi]("WinNT://./${var.win_username}, user")
$admin.PSBase.Invoke("SetPassword", "${var.win_password}")
</powershell>
EOF

  provisioner "remote-exec" {
    inline = ["echo 'Wait until Winrm is ready'"]

    connection {
    type = "winrm"
    timeout = "10m"
    insecure = "true"
    port     = "5986"
    https    = "true"
    agent    = "false"
    user = "${var.win_username}"
    password = "${var.win_password}"
    host = aws_instance.windows_2019.public_ip
  }
  }

  provisioner "local-exec" {
    working_dir = "./ansible/"
    environment = {
      ANSIBLE_CONFIG = "./ansible/ansible.cfg"
      ANSIBLE_ROLES_PATH = "/home/ec2-user/maf/iac-ansible-heat/roles/:/home/ec2-user/maf/iac-ansible-kaspersky/roles/:/home/ec2-user/maf/iac-ansible-fireeye/roles/"
    }
    command = join(
      " ", [
      "cp hosts.default hosts;",
      " sed -i 's/PUBLICIP/${aws_instance.windows_2019.public_ip}/g' hosts;",
      "ansible-playbook -i hosts server.yml",
      " --vault-password-file=.vault.txt"
     ]
    ) 
  }
}
