#:FILE WITH VARIABLES
variable "project" {
  description = "The name of the project"
  type        = string
  default     = ""
}
variable "project_number" {
  description = "The number of the project"
  type        = string
  default     = ""
}
variable "location" {
  description = "Specifies the supported Google location where the resource exists. Changing this forces a new resource to be created"
  type        = string
  default     = "us-central1"
}
variable "zone" {
  type        = string
  description = "Zone where the resources should be created."
  default     = "us-central1-a"
}
variable "env" {
  description = "The environment"
  type        = string
  default     = "shared"
}
variable "description" {
  description = "The user-provided description of the repository"
  type        = string
  default     = "Recurso compartilhado com todos os componentes do Bootcamp"
}
variable "db-name" {
  type        = string
  description = "Nome do BD a ser criado"
  default     = "app-prd-db"
}
variable "user-name" {
  description = "The name of the default user"
  type        = string
  default     = ""
}
variable "additional-databases" {
  description = "A list of databases to be created in your cluster"
  type = list(object({name=string, charset=string, collation=string}))
  default = [
    {name = "app-dev-db", charset = "UTF8", collation = "en_US.UTF8"},
    {name = "app-staging-db", charset = "UTF8", collation = "en_US.UTF8"},
  ]
}
#:END
