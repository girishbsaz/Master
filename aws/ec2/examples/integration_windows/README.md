![Azure](https://img.shields.io/badge/azure-%230072C6.svg?style=for-the-badge&logo=microsoftazure&logoColor=white)
![Terraform](https://img.shields.io/badge/terraform-%235835CC.svg?style=for-the-badge&logo=terraform&logoColor=white)
![Ansible](https://img.shields.io/badge/ansible-%231A1918.svg?style=for-the-badge&logo=ansible&logoColor=white)
![Microsoft](https://img.shields.io/badge/Microsoft-0078D4?style=for-the-badge&logo=microsoft&logoColor=white)
![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)
![GitHub Actions](https://img.shields.io/badge/github%20actions-%232671E5.svg?style=for-the-badge&logo=githubactions&logoColor=white)
![Powershell](https://img.shields.io/badge/powershell-5391FE?style=for-the-badge&logo=powershell&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)

## Ansible Terraform Integration for AWS

Examples of how to integrate Terraform infrastructure provisioning and Ansible configuration management for end-to-end automation

### Pre-requisites
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)
- [Terraform](https://www.terraform.io/downloads)
- [Azure Cli](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli-linux?pivots=apt)

### Add Azure Service Principal in ~/.azure/credentials file

```
vi ~/.azure/credentials
```

```
[default]
subscription_id=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
client_id=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
secret=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
tenant=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
```

### Provision instance with Terraform

* Get latest Windows AMI
* Create AWS key pair
* Create AWS security group
* Create EC2 instance with local-exec provisioner triggering Ansible

### Configuration instance with Ansible

* Install `iac-ansible-fireeye` role
* Install `iac-ansible-kaspersky` role
* Install `iac-ansible-heat` role

### Provisioner - `local-exec`

```
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

```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_instance.windows_2019](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ami_id"></a> [ami\_id](#input\_ami\_id) | n/a | `any` | n/a | yes |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | n/a | `any` | n/a | yes |
| <a name="input_security_group_id"></a> [security\_group\_id](#input\_security\_group\_id) | n/a | `any` | n/a | yes |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | n/a | `any` | n/a | yes |
| <a name="input_win_password"></a> [win\_password](#input\_win\_password) | n/a | `any` | n/a | yes |
| <a name="input_win_username"></a> [win\_username](#input\_win\_username) | n/a | `any` | n/a | yes |

