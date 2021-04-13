terraform {
  required_providers {
    upcloud = {
      source = "UpCloudLtd/upcloud"
      version = "~> 2.0"
    }
  }
}

provider "upcloud"  {
}


# create SDN private network with DHCP enabled on 10.0.0.0/24
resource "upcloud_network" "sdn_network" {
  name = "eucalyptos Private Network"
  zone = "es-mad1"

  ip_network {
    address = "10.0.0.0/24"
    dhcp    = true
    family  = "IPv4"
  }
}



#loadbalancer

 resource "upcloud_server" "server1" {
     hostname = "terraform.loadbalance.eucaluptos.com"
     zone = "es-mad1"
     plan = "1xCPU-1GB"
     
template {
     
     size = 25
     #template Debian 10
     storage = "01000000-0000-4000-8000-000020050100"
       }
network_interface {
     type = "public"
  }

network_interface {
     type = "utility"
  }

network_interface {
     type = "private"
     ip_address = "10.0.0.2"
     network = upcloud_network.sdn_network.id
  }


login {
    user = "root"
    keys = [
      "ssh-rsa ",
    ]
    create_password = true
    password_delivery = "email"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello world!'"
    ]
  }
}



#Webserver1
 
 resource "upcloud_server" "server2" {
     hostname = "terraform.webserver.eucaluptos.com"
     zone = "es-mad1"
     plan = "1xCPU-1GB"
     
template {
     
     size = 25
     #template Debian 10
     storage = "01000000-0000-4000-8000-000020050100"
       }
network_interface {
     type = "public"
  }

network_interface {
     type = "utility"
  }

network_interface {
     type = "private"
     ip_address = "10.0.0.3"
     network = upcloud_network.sdn_network.id
  }


login {
    user = "root"
    keys = [
      "ssh-rsa ",
    ]
    create_password = true
    password_delivery = "email"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello world!'"
    ]
  }
}



#Webserver2

 resource "upcloud_server" "server3" {
     hostname = "terraform.webserver2.eucaluptos.com"
     zone = "es-mad1"
     plan = "1xCPU-1GB"
     
template {
     
     size = 25
     #template Debian 10
     storage = "01000000-0000-4000-8000-000020050100"
       }
network_interface {
     type = "public"
  }

network_interface {
     type = "utility"
  }

network_interface {
     type = "private"
     ip_address = "10.0.0.4"
     network = upcloud_network.sdn_network.id
  }


login {
    user = "root"
    keys = [
      "ssh-rsa ",
    ]
    create_password = true
    password_delivery = "email"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello world!'"
    ]
  }
}


#Database

 resource "upcloud_server" "server4" {
     hostname = "terraform.database.eucaluptos.com"
     zone = "es-mad1"
     plan = "1xCPU-1GB"
     
template {
     
     size = 25
     #template Debian 10
     storage = "01000000-0000-4000-8000-000020050100"
       }
network_interface {
     type = "public"
  }

network_interface {
     type = "utility"
  }

network_interface {
     type = "private"
     ip_address = "10.0.0.5"
     network = upcloud_network.sdn_network.id
  }


login {
    user = "root"
    keys = [
      "ssh-rsa ",
    ]
    create_password = true
    password_delivery = "email"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Hello world!'"
    ]
  }
}
