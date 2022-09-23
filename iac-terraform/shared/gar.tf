#:ARTIFACT REGISTRY PARA ARMAZENAMENTO DE ARTEFATOS / IMAGENS DOCKER
module "gar-shared" {
  source       = "../modulos/gar/"
  project      = var.project
  location     = var.location
  env          = var.env
  description  = var.description
  depends_on = [google_project_service.artifactregistry_api]
}
#:END