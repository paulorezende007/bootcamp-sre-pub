// Cloud Run - Postgresql Private
// Depende de VPC
// Depende de "Private Access" para acesso Privado
module "sql-db" {
  source                = "../modulos/postgresql/"
  project_id            = var.project
  name                  = "postgresql-${var.project}-${var.env}-01"  #:nome da instancia de BD
  database_version      = "POSTGRES_14"
  region                = var.location
  zone                  = var.zone
  tier                  = "db-f1-micro"  #:Tamanho da maquina
  deletion_protection   = false
  availability_type     = "ZONAL" #:Requerido apenas se for usar HA (REGIONAL)
  enable_default_db     = true
  db_name               = var.db-name     #:Nome da database default (requerido apenas se "enable_default_db = true")
  user_name             = var.user-name   #:User Database
  additional_databases  = var.additional-databases  #:Opcional - bases de dados adicionais
  ip_configuration = {
    ipv4_enabled        = false  #:Se True, acesso public será habilitado
    private_network     = "projects/${var.project}/global/networks/${module.vpc.network_name}"
    require_ssl         = false
    allocated_ip_range  = null
    authorized_networks = []
  }
  depends_on            = [google_service_networking_connection.private_service_access, google_project_service.sqladmin_api]
}

// Private Access Postgresql
// Depende de VPC
resource "google_compute_global_address" "google-managed-services-range" {
  project       = var.project
  name          = "google-managed-services-${module.vpc.network_name}"
  purpose       = "VPC_PEERING"
  address       = "10.9.9.0"
  prefix_length = 24
  address_type  = "INTERNAL"
  network       = module.vpc.network_id
}

resource "google_service_networking_connection" "private_service_access" {
  network                 = module.vpc.network_id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.google-managed-services-range.name]
  depends_on              = [google_compute_global_address.google-managed-services-range]
}
#:END