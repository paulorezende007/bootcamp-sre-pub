#:FILE WITH VARIABLES
variable "project" {
  description = "The name of the project"
  type        = string
  default     = ""
}
variable "location" {
  description = "Specifies the supported Google location where the resource exists. Changing this forces a new resource to be created"
  type        = string
  default     = "us-central1"
}
variable "env" {
  description = "The environment"
  type        = string
  default     = "prd"
}
variable "vpc-name" {
  description = "VPC Name"
  type        = string
  default     = "vpc-bootcamp-sre-shared"
}
variable "subnet_ip" {
  description = "Endereço de Subnet"
  type        = string
  default     = "10.10.11.0/24"
}
variable "db-instance-connection-name" { 
  description = "DB Connection Name"
  type        = string
  default     = "" //"coloque aqui a conexao com o BD"
}
variable "db-name" {
  description = "DB Name"
  type        = string
  default     = "app-prd-db"
}
variable "db-user" {
  description = "DB USER"
  type        = string
  default     = ""
}
variable "db-secret-passwd" {
  description = "Nome da Secret Manager de DB Passwd"
  type        = string
  default     = "DB_PASSWORD"
}
variable "db-host" {
  description = "IP do Servidor de BD - Privado"
  type        = string
  default     = "10.9.9.12"
}
#:END