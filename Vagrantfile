storage_size = 5
Vagrant.configure("2") do |config|

  config.persistent_storage.enabled = true
  config.persistent_storage.location = "./dev/second_hdd.vdi"
  config.persistent_storage.size = 5000
  config.persistent_storage.mountname = 'docker-vg'
  config.persistent_storage.diskdevice = '/dev/sdb'
  config.persistent_storage.partition = false
  config.persistent_storage.use_lvm = false
  config.persistent_storage.format = false

  config.persistent_storage.volgroupname = 'docker-vg'

  config.vm.box = "centos/7"
  config.vm.hostname = "dev.hawkular.com"
  config.vm.network "private_network", ip: "192.168.65.4"

  config.vm.provider "virtualbox" do |v|
    v.memory = 8096
    v.cpus = 4
  end

  config.vm.provision :hosts do |provisioner|
    provisioner.add_localhost_hostnames = false
    provisioner.add_host '192.168.65.4', ['dev.hawkular.com']
    provisioner.add_host '192.168.65.4', ['openshift.dev.hawkular.com']
    provisioner.add_host '192.168.65.4', ['kibana.dev.hawkular.com']
    provisioner.add_host '192.168.65.4', ['mux.dev.hawkular.com']
  end
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, path: "clone-ansible.sh"
  config.vm.provision "file", source: "vars.yaml.template", destination: "/opt/ansible/vars.yaml"
  config.vm.provision "file", source: "ansible-inventory", destination: "/opt/ansible/ansible-inventory"
  config.vm.provision "file", source: "run-ansible.sh",   destination: "/home/vagrant/run-ansible.sh"

end
