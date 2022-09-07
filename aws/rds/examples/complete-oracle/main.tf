provider "aws" {
  region = "eu-west-1"
}
################################################################################
# RDS Module
################################################################################

module "db" {
    source              = "../../../rds"
  project             = "temp"
  environment         = "sandbox"
  business_unit       = "maf"
  owner               = "dev"
  operational_company = "prop"
  confidentiality      = "internal"
  technical_owner = "techinal demo"

  

  engine               = "oracle-ee"
  engine_version       = "19.0.0.0.ru-2021-10.rur-2021-10.r1"
  family               = "oracle-ee-19.0" # DB parameter group
  major_engine_version = "19.0"           # DB option group
  instance_class       = "db.t3.large"
  license_model        = "bring-your-own-license"

  allocated_storage     = 20
  max_allocated_storage = 100

  # Make sure that database name is capitalized, otherwise RDS will try to recreate RDS instance every time
  name  = "ORACLE"
  username = "complete_oracle"
  port     = 1521

  multi_az               = true
  subnet_ids             = ["subnet-05a98500f59668967", "subnet-0621f752125d5eeed"]
  vpc_security_group_ids = ["sg-017d88d1447a02279"]

  maintenance_window              = "Mon:00:00-Mon:03:00"
  backup_window                   = "03:00-06:00"
  enabled_cloudwatch_logs_exports = ["alert", "audit"]
  

  backup_retention_period = 1 #for automated backups
  skip_final_snapshot     = true
  deletion_protection     = false

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  create_monitoring_role                = false

  # See here for support character sets https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Appendix.OracleCharacterSets.html
  character_set_name = "AL32UTF8"

  
}
