#!/usr/bin/env bash

curl https://raw.githubusercontent.com/ViaQ/Main/master/centos7-viaq.repo > /etc/yum.repos.d/centos7-viaq.repo

yum install wget git net-tools bind-utils iptables-services bridge-utils bash-completion kexec-tools sos psacct screen openshift-ansible git python2-passlib
  yum remove openshift-ansible -y
yum install docker -y
yum update
sed -i '/OPTIONS=.*/c\OPTIONS="--selinux-enabled --insecure-registry 172.30.0.0/16"' /etc/sysconfig/docker
sudo vgcreate docker-vg /dev/sdb
cat <<EOF > /etc/sysconfig/docker-storage-setup
VG=docker-vg
EOF
systemctl stop docker
docker-storage-setup
systemctl enable docker
systemctl start docker
yum install screen openshift-ansible git python2-passlib -y
yum remove openshift-ansible -y
mkdir -p /opt/ansible
chmod 777 /opt/ansible
cd /opt/ansible
ANSIBLE_LOG_PATH=/tmp/ansible.log
sudo systemctl stop firewalld
sudo systemctl disable firewalld
