#:SUBNET
module "subnets" {
  source        = "../modulos/subnets/"
  project_id    = var.project
  network_name  = "vpc-bootcamp-sre-shared"
  subnets = [
    {
      subnet_name       = "subnet-${var.env}-public"
      subnet_ip         = var.subnet_ip
      subnet_region     = var.location
      description       = "Subnet publica ${var.env}"
      subnet_flow_logs  = "false"
    }
  ]
}
#:END