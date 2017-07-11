#!/bin/bash
vm_uuid=$(cat .vagrant/machines/default/virtualbox/id)
disk_uuid=$(vboxmanage showvminfo  ${vm_uuid} | grep second_hdd | sed -n 's/.* (UUID: \(.*\))/\1/p' )
vagrant destroy -f
vboxmanage closemedium disk ${disk_uuid}  --delete
rm -Rf ./dev/
