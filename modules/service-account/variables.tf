variable "name" {
  description = "Service account managed by terraform"
  type        = string
  default     = "yandex-iam-service-account"
}

variable "description" {
  description = "Description of the service account"
  type        = string
  default     = "Managed by terraform"
}

variable "folder_id" {
  description = "ID of the folder that the service account will be created in. Defaults to the provider folder configuration."
  type        = string
}

variable "roles" {
  description = "Roles of the service account in the folder."
  type = set(string)
  default = ["storage.editor"]
}