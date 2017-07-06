#!/usr/bin/env bash
sudo ansible-playbook -vvv -e @/opt/ansible/vars.yaml -i /opt/ansible/ansible-inventory /opt/ansible/playbooks/byo/config.yml
