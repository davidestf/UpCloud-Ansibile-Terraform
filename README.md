# Ansibile-Terraform UpCloud Loadbalancer

Terraform 

Deployment: Loadbalancer and 2 X Webservers connected throught SDN using Debian template


Ansibile:

Upgrade the systems, Install the firewall , NGINX webserver and Haproxy  




To make everything work you would need:

-Install UpCloud Terraform/Ansible 



-Variables       |    Configuration variables :


ssh_private_key_path:  Local path to your SSH private key.

hostname:              Server hostname.

upcloud_zone:         	UpCloud zone to use ex. "es-mad1".  

hostname_SDN:          SDN hostname



-Give the execution permission.

chmod +x install.sh
then run it:
./install.sh

 
 
