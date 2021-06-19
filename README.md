# Deploy Ansibile-Terraform UpCloud Loadbalancer

## Terraform 

Deployment: Loadbalancer and 2 X Webservers connected throught SDN using Debian template


## Ansibile:

Upgrade the systems, Install the firewall , NGINX webserver and Haproxy  




# To make everything work you would need:

## - UpCloud Account

## - Install UpCloud Terraform/Ansible 

## and

## - Configure the variables 

## Variables       |**** |   file(variables.tf)
```
ssh_private_key_path:  Local path to your SSH private key.

hostname:              Server hostname.

upcloud_zone:          UpCloud zone to use ex. "es-mad1".  

hostname_SDN:          SDN hostname
```

Clone repository
```
git clone https://github.com/dstf/UpCloud-Ansibile-Terraform.git
```
-Give the execution permission.
```
chmod +x install.sh
```
then run it:
```
./install.sh
```
 ![](https://project001.06a7f2c2-5c56-40d7-aded-6455af08391b.es-mad1.upcloudobjects.com/github/loadbalancer.gif)
 
