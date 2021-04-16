
---
- name: Webserver installation
  hosts: machines
#privatest.org
 # remote_user: root
  become: true
#  vars:
#hostname: ubun    
#servername: ubun
# ssh_keys:
 #          -  ssh-rsa AAAA..


  tasks:
    - name: Install UFW
      apt:
        name: ufw
        state: present
    - name: Setup rules
      command: "{{ item }}"
      with_items:
        - ufw default deny incoming
        - ufw allow ssh
        - ufw allow http
        - ufw allow https
        - ufw --force enable
