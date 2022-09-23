#:VPC
module "vpc" {
  source                  = "../modulos/vpc/"
  project_id              = var.project
  network_name            = "vpc-${var.project}-${var.env}"
  auto_create_subnetworks = false
  depends_on              = [google_project_service.servicenetworking_api]
}
#:SUBNET
module "subnet-db" {
  source        = "../modulos/subnets/"
  project_id    = module.vpc.project_id
  network_name  = module.vpc.network_name
  subnets = [
    {
      subnet_name           = "subnet-db-private"  # Subnet Privada DB
      subnet_ip             = "10.10.10.0/24"
      subnet_region         = var.location
      description           = "Subnet privada DB"
      subnet_private_access = "true"
      subnet_flow_logs      = "true"
    }
  ]
}
#:END