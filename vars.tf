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

variable "health_check_cidrs" {
  type        = set(string)
  description = "known CIDR ranges for GCP Health Checks"
  default     = ["130.211.0.0/22", "35.191.0.0/16"]
}
variable "base_name" {
  type        = string
  description = "description"
  default     = "pcap"
}

variable "machine_type" {
  type        = string
  description = "GCE machine type"
  default     = "e2-medium"
}
variable "compute_tag" {
  type        = string
  description = "compute tag"
  default     = "pcap-vm"
}

variable "source_network_tags" {
  type        = list(string)
  description = "mirroring source network tags"
}


