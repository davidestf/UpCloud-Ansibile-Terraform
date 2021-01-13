
terraform {
  required_providers {
    upcloud = {
      source = "UpCloudLtd/upcloud"
      version = "1.0.0"
    }
  }
}


resource "upcloud_server" "server2" {
  # System hostname
  hostname = "terraform.webserver.com"

  # Availability zone
  zone = "es-mad1"

  # Number of CPUs and memory in GB
  plan = "1xCPU-1GB"

  storage_devices {
    # System storage device size
    size = 25

    # Template UUID Debian 10
    storage = "01000000-0000-4000-8000-000020050100"

    # Storage device typeC
    tier   = "maxiops"
    action = "clone"
  }

  # Network interfaces
  network_interface {
    type = "public"
  }


  network_interface {
    type = "utility"
  }




  # Include at least one public SSH key
  login {
    user = "root"
    keys = [
      "ssh-rsa ....",

    ]
    create_password = true
    password_delivery = "email"
  }


  # Remotely executing a command on the server
  provisioner "remote-exec" {
    inline = [
      "echo 'Hello world!'"
    ]
  }
}
