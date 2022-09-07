![AWS](https://img.shields.io/badge/AWS-%23FF9900.svg?style=for-the-badge&logo=amazon-aws&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Red Hat](https://img.shields.io/badge/Red%20Hat-EE0000?style=for-the-badge&logo=redhat&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

## Ansible Terraform Integration for AWS

Examples of how to integrate Terraform infrastructure provisioning and Ansible configuration management for end-to-end automation

### Pre-requisites
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Terraform](https://www.terraform.io/downloads)
- [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

### AWS Authentication credentials file

`vi ~/.aws/credentials`

```
#[default]
#DevOps-Playground
aws_access_key_id = xxxxxxxxxxxxxxxxxxxx
aws_secret_access_key = xxxxxxxxxxxxxxxxxxx
aws_region = eu-west-1
```

### Provision instance with Terraform

* Get latest Amazon Linux 2/Rhel/Ubuntu AMI
* Create AWS key pair
* Create AWS security group
* Create EC2 instance with local-exec provisioner triggering Ansible

### Configuration instance with Ansible

* Install `iac-ansible-fireeye` role

### Provisioner - `local-exec`

```
  provisioner "local-exec" {
  //  working_dir = "./ansible/"
    environment = { 
      ANSIBLE_ROLES_PATH = "/home/ec2-user/maf/iac-ansible-fireeye/roles/:/home/ec2-user/maf/iac-ansible-bmc/roles/"
      ANSIBLE_HOST_KEY_CHECKING = false
    }
    command = "ansible-playbook -i ${aws_instance.linux.public_ip}, --private-key ${var.private_key_path} ansible/server.yml --vault-password-file=./ansible/.vault.txt -u ${var.instance_user}"
  }

```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_instance.linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | n/a | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `any` | n/a | yes |
| <a name="input_instance_user"></a> [instance\_user](#input\_instance\_user) | n/a | `any` | n/a | yes |
| <a name="input_key_name"></a> [key\_name](#input\_key\_name) | n/a | `any` | n/a | yes |
| <a name="input_private_key_path"></a> [private\_key\_path](#input\_private\_key\_path) | n/a | `any` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | n/a | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `any` | n/a | yes |

