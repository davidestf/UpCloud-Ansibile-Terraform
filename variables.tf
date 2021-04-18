variable "ssh_private_key_path" {
  default     = "/home/ds/.ssh/id_rsa.pub"
  type        = string
}


variable "hostname-loadbalancer" {
  default     = "loadbalancer.mytest.com"
  type        = string
}

variable "hostname-webserver001" {
  default     = "webserver001.mytest.com"
  type        = string
}

variable "hostname-webserver002" {
  default     = "webserver002.mytest.com"
  type        = string
}


variable "upcloud_zone" {
  default     = "uk-lon1"
  type        = string
}


variable "hostname_SDN" {
  default     = "mytest.com Private Network"
  type        = string
}
