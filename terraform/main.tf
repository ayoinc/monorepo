module "vpc" {
  source = "./modules/vpc"
}

module "security_group" {
  source = "./modules/security_group"
  vpc_id = module.vpc.vpc_id
}

module "tls_key" {
  source = "./modules/tls"
}

module "ec2_instance" {
  source            = "./modules/ec2"
  key_name          = module.tls_key.key_name
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.security_group_id
}

module "database" {
  source            = "./modules/database"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.security_group.security_group_id
}
