# Ansibile-Terraform UpCloud Loadbalancer

Terraform 

Deployment: Loadbalancer and 2 X Webservers connected throught SDN using Debian template


Ansibile:

Install firewall , NGINX webserver and Haproxy  


To make everything work you need:

Install UpCloud Terraform/Ansible 

Configuration variables file:
ssh_private_key_path: 	Local path to a SSH private key.
upcloud_zone: 	UpCloud zone to use ex. "uk-lon1".  list of available zones API: GET  /1.3/zone  
hostname: 	Server hostname

Give the execution permission.

chmod +x install.sh

then run it:

./install.sh

 
 
