#!/bin/bash

terraform init -input=false
terraform plan -out=tfplan
terraform apply "tfplan" 

ansible-playbook webserver001.yml -i hosts -e 'ansible_python_interpreter=/usr/bin/python3'
ansible-playbook webserver002.yml -i hosts -e 'ansible_python_interpreter=/usr/bin/python3'
ansible-playbook haproxy-install.yml -i hosts -e 'ansible_python_interpreter=/usr/bin/python3'
