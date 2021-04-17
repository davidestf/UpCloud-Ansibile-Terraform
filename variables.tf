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



variable "ssh_private_key_path" {
  default     = "/home/user/.ssh/id_rsa.pub"
  type        = string
}

 
variable "upcloud_zone" {
  default     = "es-mad1"
  type        = string
}

