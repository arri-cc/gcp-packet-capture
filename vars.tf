variable "project" {
  type        = string
  description = "description"
}

variable "region" {
  type        = string
  description = "description"
}

variable "zone" {
  type        = string
  description = "description"
}

variable "network" {
  type        = string
  description = "description"
}

variable "subnet_cidr" {
  type        = string
  description = "subnet CIDR"
  default     = "10.99.0.0/24"
}

variable "ilb_ip" {
  type        = string
  description = "ilb IP address"
  default     = "10.99.0.99"
}

variable "base_name" {
  type        = string
  description = "description"
  default     = "pcap"
}

variable "mirroring_network_tag" {
  type        = list
  description = "mirroring source network tags"
}


