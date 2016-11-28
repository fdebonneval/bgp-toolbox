# Security groups
resource "openstack_networking_secgroup_v2" "lab-00-icmp-ssh" {
  name        = "lab-00-icmp-ssh"
  description = "ICMP and SSH Security groups"
}

#resource "openstack_networking_secgroup_rule_v2" "icmp" {
#  direction = "ingress"
#  ethertype = "IPv4"
#  protocol = "icmp"
#  port_range_min = -1
#  port_range_max = -1
#  remote_ip_prefix = "0.0.0.0/0"
#  security_group_id = "${openstack_networking_secgroup_v2.lab-00-icmp-ssh.id}"
#}

resource "openstack_networking_secgroup_rule_v2" "tcp-22" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 22
  port_range_max    = 22
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.lab-00-icmp-ssh.id}"
}

resource "openstack_networking_secgroup_v2" "lab-00-80-443" {
  name        = "lab-00-80-443"
  description = "80 and 443 Security groups"
}

resource "openstack_networking_secgroup_rule_v2" "tcp-80" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 80
  port_range_max    = 80
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.lab-00-80-443.id}"
}

resource "openstack_networking_secgroup_rule_v2" "tcp-443" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 443
  port_range_max    = 443
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.lab-00-80-443.id}"
}

resource "openstack_networking_secgroup_v2" "lab-00-179" {
  name        = "lab-00-179"
  description = "179 Security groups"
}

resource "openstack_networking_secgroup_rule_v2" "tcp-179" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "tcp"
  port_range_min    = 179
  port_range_max    = 179
  remote_ip_prefix  = "0.0.0.0/0"
  security_group_id = "${openstack_networking_secgroup_v2.lab-00-179.id}"
}
