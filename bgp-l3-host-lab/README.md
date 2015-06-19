# Bridge configuration example
* http://www.opencloudblog.com/?p=66

# Bridge troubleshooting page
* http://www.linuxfoundation.org/collaborate/workgroups/networking/bridge

# Cammands sent to set-up the first hypervisor
 ip link set dev eth2 up
 ip netns add ns-usr
 brctl addbr br-usr
 brctl stp br-usr off
 brctl addif br-usr eth2
 ip link set dev br-usr up
 ip link add tap-ns-usr type veth peer name tap-br-usr
 brctl addif br-usr tap-br-usr
 ip link set tap-ns-usr netns ns-usr
 ip link set dev tap-br-usr up
 ip netns exec ns-usr ip link set dev tap-ns-usr up
 ??? for f in /proc/sys/net/bridge/bridge-nf-*; do echo 0 > $f; done

# Troubleshooting
 ip addr flush dev eth0

# Terraform example with consul
 https://github.com/deverton/terraform-aws-consul

# Terraform, pointing to a cloudinit file
 user_data = "${file(\"files/consul/cloud-init.txt\")}"

# Terraform tips for instances naming
 resource "aws_instance" "web" {
     count = 5
     tags {
         Name = "web-${count.index+1}"
     }
 }
