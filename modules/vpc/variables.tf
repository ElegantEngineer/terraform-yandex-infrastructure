variable "name" {
  description = "VPC name"
  type        = string
}

variable "description" {
  description = "VPC description"
  type        = string
}

variable "tags" {
  description = "A set of key/value label pairs to assign."
  type        = map(string)
  default     = {}
}

variable "subnet" {
  description = "Subnet address"
  type        = string
}

variable "zone" {
  type        = string
  description = "Yandex Cloud compute zone"
}