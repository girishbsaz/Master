locals {
  enhanced_monitoring_iam_role_name = element(concat(aws_iam_role.enhanced_monitoring.*.name, [""]), 0)
  enhanced_monitoring_iam_role_arn  = element(concat(aws_iam_role.enhanced_monitoring.*.arn, [""]), 0)
  db_instance_address               = element(concat(aws_db_instance.db_mssql.*.address, aws_db_instance.db.*.address, [""]), 0)
  db_instance_arn                   = element(concat(aws_db_instance.db_mssql.*.arn, aws_db_instance.db.*.arn, [""]), 0)
  db_instance_availability_zone     = element(concat(aws_db_instance.db_mssql.*.availability_zone, aws_db_instance.db.*.availability_zone, [""]), 0)
  db_instance_endpoint              = element(concat(aws_db_instance.db_mssql.*.endpoint, aws_db_instance.db.*.endpoint, [""]), 0)
  db_instance_hosted_zone_id        = element(concat(aws_db_instance.db_mssql.*.hosted_zone_id, aws_db_instance.db.*.hosted_zone_id, [""]), 0)
  db_instance_id                    = element(concat(aws_db_instance.db_mssql.*.id, aws_db_instance.db.*.id, [""]), 0)
  db_instance_resource_id           = element(concat(aws_db_instance.db_mssql.*.resource_id, aws_db_instance.db.*.resource_id, [""]), 0)
  db_instance_status                = element(concat(aws_db_instance.db_mssql.*.status, aws_db_instance.db.*.status, [""]), 0)
  db_instance_name                  = element(concat(aws_db_instance.db_mssql.*.name, aws_db_instance.db.*.name, [""]), 0)
  db_instance_username              = element(concat(aws_db_instance.db_mssql.*.username, aws_db_instance.db.*.username, [""]), 0)
  db_instance_port                  = element(concat(aws_db_instance.db_mssql.*.port, aws_db_instance.db.*.port, [""]), 0)
  db_instance_ca_cert_identifier    = element(concat(aws_db_instance.db_mssql.*.ca_cert_identifier, aws_db_instance.db.*.ca_cert_identifier, [""]), 0)
  db_instance_domain                = element(concat(aws_db_instance.db_mssql.*.domain, [""]), 0)
  db_instance_domain_iam_role_name  = element(concat(aws_db_instance.db_mssql.*.domain_iam_role_name, [""]), 0)
  db_instance_master_password       = element(concat(aws_db_instance.db_mssql.*.password, aws_db_instance.db.*.password, [""]), 0)
}

output "enhanced_monitoring_iam_role_name" {
  description = "The name of the monitoring role"
  value       = local.enhanced_monitoring_iam_role_name
}

output "enhanced_monitoring_iam_role_arn" {
  description = "The Amazon Resource Name (ARN) specifying the monitoring role"
  value       = local.enhanced_monitoring_iam_role_arn
}

output "db_instance_address" {
  description = "The address of the RDS instance"
  value       = local.db_instance_address
}

output "db_instance_arn" {
  description = "The ARN of the RDS instance"
  value       = local.db_instance_arn
}

output "db_instance_availability_zone" {
  description = "The availability zone of the RDS instance"
  value       = local.db_instance_availability_zone
}

output "db_instance_endpoint" {
  description = "The connection endpoint"
  value       = local.db_instance_endpoint
}

output "db_instance_hosted_zone_id" {
  description = "The canonical hosted zone ID of the DB instance (to be used in a Route 53 Alias record)"
  value       = local.db_instance_hosted_zone_id
}

output "db_instance_id" {
  description = "The RDS instance ID"
  value       = local.db_instance_id
}

output "db_instance_resource_id" {
  description = "The RDS Resource ID of this instance"
  value       = local.db_instance_resource_id
}

output "db_instance_status" {
  description = "The RDS instance status"
  value       = local.db_instance_status
}

output "db_instance_name" {
  description = "The database name"
  value       = local.db_instance_name
}

output "db_instance_username" {
  description = "The master username for the database"
  value       = local.db_instance_username
  sensitive   = true
}

output "db_instance_port" {
  description = "The database port"
  value       = local.db_instance_port
}

output "db_instance_ca_cert_identifier" {
  description = "Specifies the identifier of the CA certificate for the DB instance"
  value       = local.db_instance_ca_cert_identifier
}

output "db_instance_domain" {
  description = "The ID of the Directory Service Active Directory domain the instance is joined to"
  value       = local.db_instance_domain
}

output "db_instance_domain_iam_role_name" {
  description = "The name of the IAM role to be used when making API calls to the Directory Service. "
  value       = local.db_instance_domain_iam_role_name
}

output "db_instance_master_password" {
  description = "The master password"
  value       = local.db_instance_master_password
  sensitive   = true
}
