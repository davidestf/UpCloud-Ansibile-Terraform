#!/bin/bash

terraform init -input=false
terraform plan -out=tfplan
terraform apply "tfplan" 

ansible-playbook webserver001.yml -i hosts
ansible-playbook webserver002.yml  -i hosts
ansible-playbook haproxy-install.yml -i hosts
