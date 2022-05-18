variable "yc_token" {
  description = "Yandex Cloud token"
  type        = string
  sensitive   = true
  default     = ""
}

variable "yc_cloud_id" {
  description = "Yandex Cloud ID where resources will be created"
  type        = string
  sensitive   = true
  default     = ""
}

variable "yc_folder_id" {
  description = "Yandex Cloud Folder ID where resources will be created"
  type        = string
  default     = ""
}

variable "yc_zone" {
  description = "Yandex Cloud compute default zone"
  type        = string
  default     = "ru-central1-a"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "project-1"
}

variable "env_name" {
  description = "Environment name"
  type        = string
  default     = "dev"
}