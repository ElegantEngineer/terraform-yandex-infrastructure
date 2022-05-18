variable "name" {
  description = "Compute instance name"
  type        = string
}

variable "region" {
  description = "Region"
  type        = string
  default     = "ru"
}

variable "tags" {
  description = "A set of key/value label pairs to assign."
  type        = map(string)
  default     = {}
}

variable "db_storage_type" {
  description = "DB storage type"
  type    = string
  default = "network-hdd"
}

variable "image_family" {
  description = "Yandex Cloud Compute Image family"
  type        = string
  default     = "ubuntu-2004-lts"
}

variable "zone" {
  type        = string
  description = "Yandex Cloud compute default zone"
  default     = "ru-central1-a"
}

variable "instance_count" {
  type        = number
  description = "Instance count"
  default     = 1
}

variable primary_disk_size {
  type        = number
  description = "Primary disk size"
  default     = 12
}

variable "secondary_disk" {
  description = "Additional secondary disk to attach to the instance"
  type        = map(map(string))
  default     = {}
}

variable "cores" {
  description = "CPU cores for the instance"
  type        = number
  default     = 2
}

variable "memory" {
  description = "Memory size for the instance in GB"
  type        = number
  default     = 2
}

variable "core_fraction" {
  description = "Baseline performance for a core as a percent"
  type        = number
  default     = 100
}

variable "platform_id" {
  description = "Platform id"
  type        = string
  default     = "standard-v2"
}

variable "is_nat" {
  description = "Provide a public address for instance to access the internet over NAT"
  type        = bool
  default     = false
}

variable "subnet_id" {
  description = "Subnet id"
  type        = string
}

variable "secondary_disk_types" {
  description = "Secondary disk types"
  type    = map
  default = {
    "hdd" = "network-hdd"
    "ssd" = "network-ssd"
  }
}