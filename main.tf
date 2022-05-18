
module "vpc" {
  source = "./modules/vpc"

  name        = "network-1"
  description = "Main network"
  subnet      = "10.100.0.0/24"
  zone        = var.yc_zone

  tags = {
    project     = var.project_name,
    environment = "prod"
  }
}

module "web-compute" {
  source = "./modules/compute"

  region          = "ru"
  zone            = "ru-central1-a"
  image_family    = "ubuntu-2004-lts"
  is_nat          = true
  subnet_id       = module.vpc.subnet_id

  secondary_disk = {}

  instance_count = 1
  name           = "web"
  platform_id    = "standard-v2"

  tags = {
    project     = var.project_name,
    environment = "prod"
  }

  depends_on = [
    module.vpc
  ]
}

module "backend-compute" {
  source = "./modules/compute"

  region          = "ru"
  zone            = "ru-central1-a"
  image_family    = "ubuntu-2004-lts"
  is_nat          = true
  subnet_id       = module.vpc.subnet_id
  db_storage_type = "hdd"

  secondary_disk = {
    "data-storage" = {
      "size"        = "12"
      "auto_delete" = false
    }
  }

  instance_count = 1
  name           = "backend"
  platform_id    = "standard-v2"

  tags = {
    project     = var.project_name,
    environment = "prod"
  }

  depends_on = [
    module.vpc
  ]
}

module "service-account" {
  source    = "./modules/service-account"
  folder_id = var.yc_folder_id
}

module "storage" {
  source = "./modules/storage"

  sa_access_key = module.service-account.sa_access_key
  sa_secret_key = module.service-account.sa_secret_key

  depends_on = [
    module.service-account
  ]
}

output "web-internal_ip_address_this" {
  value = module.web-compute.internal_ip_address_this
}

output "web-external_ip_address_this" {
  value = module.web-compute.external_ip_address_this
}

output "backend-internal_ip_address_this" {
  value = module.backend-compute.internal_ip_address_this
}

output "backend-external_ip_address_this" {
  value = module.backend-compute.external_ip_address_this
}