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

variable "ilb_ip_cidr" {
  type        = string
  description = "ilb IP address CIDR"
  default     = "10.99.0.99/32"
}

variable "base_name" {
  type        = string
  description = "description"
  default     = "pcap"
}

variable "compute_tag" {
  type        = string
  description = "compute tag"
  default     = "${base_name}-vm"
}

variable "source_network_tags" {
  type        = set(any)
  description = "mirroring source network tags"
}


