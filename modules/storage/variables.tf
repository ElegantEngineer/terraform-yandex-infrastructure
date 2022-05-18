variable "sa_access_key" {
  description = "Service account access key"
  type        = string
}

variable "sa_secret_key" {
  description = "Service account secret key"
  type        = string
  sensitive   = true
}

variable "private-bucket-name" {
  description = "Private bucket name"
  type        = string
  default     = "private-web-storage"
}

variable "public-bucket-name" {
  description = "Public bucket name"
  type        = string
  default     = "public-media-storage"
}