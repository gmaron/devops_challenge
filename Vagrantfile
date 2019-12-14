IMAGE_NAME = "bento/ubuntu-18.04"
$set_environment_variables = <<SCRIPT
tee "/etc/profile.d/kube_envvars.sh" > "/dev/null" <<EOF
export KUBECONFIG=/home/vagrant/.kube/config
EOF
SCRIPT

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    config.vm.provider "virtualbox" do |v|
        v.memory = 1024
        v.cpus = 2
    end
      
    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.10"
        master.vm.provision "shell", inline: $set_environment_variables, run: "always"
        master.vm.provision "file", source: "./k8s.py", destination: "/home/vagrant/k8s.py"
        master.vm.provision "shell", path: "script.sh"
        master.vm.provision "shell", path: "check_namespaces.sh", run: "always"

    end
end

