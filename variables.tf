variable "ssh_private_key_path" {
  default     = "/home/ds/.ssh/id_rsa.pub"
  type        = string
}


variable "hostname-loadbalancer" {
  default     = "loadbalancer.test.com"
  type        = string
}

variable "hostname-webserver001" {
  default     = "webserver001.test.com"
  type        = string
}

variable "hostname-webserver002" {
  default     = "webserver002.test.com"
  type        = string
}


variable "upcloud_zone" {
  default     = "es-mad1"
  type        = string
}


variable "hostname_SDN" {
  default     = "test.com Private Network"
  type        = string
}
