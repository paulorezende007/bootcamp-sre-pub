#:FILE WITH VARIABLES FROM RESOURCE GROUP
variable "project" {
  description = "The name of the project"
  type        = string
}
variable "location" {
  description = "Specifies the supported Google location where the resource exists. Changing this forces a new resource to be created"
  type        = string
}
variable "env" {
  description = "The environment"
  type        = string
}
variable "description" {
  description = "The user-provided description of the repository"
  type        = string
}
variable "format" {
  description = "The format of packages that are stored in the repository"
  type        = string
  default     = "DOCKER"
}
#:END