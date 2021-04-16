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
  name = "project.com Private Network"
  zone = "es-mad1"

  ip_network {
    address = "10.0.0.0/24"
    dhcp    = true
    family  = "IPv4"
  }
}



#loadbalancer

 resource "upcloud_server" "server1" {
     hostname = "loadbalance.project.com"
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
      "ssh-rsa $sshkey",
    ]
    create_password = true
    password_delivery = "email"
  }
}





#Webserver1

 resource "upcloud_server" "server2" {
     hostname = "webserver.project.com"
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
      "ssh-rsa $sshkey",
    ]
    create_password = true
    password_delivery = "email"
  }
}


#Webserver2

 resource "upcloud_server" "server3" {
     hostname = "webserver2.project.com"
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
      "ssh-rsa $sshkey",
    ]
    create_password = true
    password_delivery = "email"
  }
}



resource "local_file" "AnsibleInventory" {
  content =  templatefile("hosts.tmpl", {
  loadbalance-ip = upcloud_server.server1.network_interface[0].ip_address,
  webserver001-ip = upcloud_server.server2.network_interface[0].ip_address,
  webserver002-ip = upcloud_server.server3.network_interface[0].ip_address
})
  filename = "hosts"
}
