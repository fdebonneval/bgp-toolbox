# Configure the OpenStack Provider

provider "openstack" {
# endpoints, credentials are taken from environment variables
}

# Networks creation
resource "openstack_networking_network_v2" "tf-net-bgp-lab-admin" {
  name = "tf-net-bgp-lab-admin"
  admin_state_up = "true"
  region = "fr1"
}
resource "openstack_networking_subnet_v2" "tf-subnet-bgp-lab-admin" {
  network_id = "${openstack_networking_network_v2.tf-net-bgp-lab-admin.id}"
  cidr = "192.168.199.0/24"
  ip_version = 4
  region = "fr1"
}

# USR networks decalration
resource "openstack_networking_network_v2" "tf-net-bgp-lab-usr-00" {
  name = "tf-net-bgp-lab-usr-00"
  admin_state_up = "true"
  region = "fr1"
}
resource "openstack_networking_subnet_v2" "tf-subnet-bgp-lab-usr-00" {
  network_id = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-00.id}"
  cidr = "10.0.0.0/29"
  ip_version = 4
  region = "fr1"
}
resource "openstack_networking_network_v2" "tf-net-bgp-lab-usr-01" {
  name = "tf-net-bgp-lab-usr-01"
  admin_state_up = "true"
  region = "fr1"
}
resource "openstack_networking_subnet_v2" "tf-subnet-bgp-lab-usr-01" {
  network_id = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-01.id}"
  cidr = "10.0.0.8/29"
  ip_version = 4
  region = "fr1"
}
resource "openstack_networking_network_v2" "tf-net-bgp-lab-usr-02" {
  name = "tf-net-bgp-lab-usr-02"
  admin_state_up = "true"
  region = "fr1"
}
resource "openstack_networking_subnet_v2" "tf-subnet-bgp-lab-usr-02" {
  network_id = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-02.id}"
  cidr = "10.0.0.16/29"
  ip_version = 4
  region = "fr1"
}
resource "openstack_networking_network_v2" "tf-net-bgp-lab-usr-03" {
  name = "tf-net-bgp-lab-usr-03"
  admin_state_up = "true"
  region = "fr1"
}
resource "openstack_networking_subnet_v2" "tf-subnet-bgp-lab-usr-03" {
  network_id = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-03.id}"
  cidr = "10.0.0.24/29"
  ip_version = 4
  region = "fr1"
}

# admin router 
resource "openstack_networking_router_v2" "tf-bgp-lab-router-admin-00" {
  name = "tf-bgp-lab-router-admin-00"
  admin_state_up = "true"
  external_gateway = "6ea98324-0f14-49f6-97c0-885d1b8dc517"
  region = ""
}

resource "openstack_networking_router_interface_v2" "tf-bgp-lab-router-admin" {
    region = "fr1"
    router_id = "${openstack_networking_router_v2.tf-bgp-lab-router-admin-00.id}"
    subnet_id = "${openstack_networking_subnet_v2.tf-subnet-bgp-lab-admin.id}"
}

resource "openstack_networking_floatingip_v2" "tf-floating-00" {
  region = "fr1"
  pool = "public"
}

# Create bastion server
resource "openstack_compute_instance_v2" "tf-bst-00" {
  name = "tf-bst-00"
  region = "fr1"
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-admin.id}"
  }
  image_id = "cc2e31fc-c24d-4905-bb45-1d57794a4f3c"
  flavor_id = "17"
  key_pair = "foucault"
  security_groups = ["icmp-ssh","bgp"]
}

# Create routers servers
resource "openstack_compute_instance_v2" "tf-bird-00" {
  name = "tf-bird-00"
  region = "fr1"
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-admin.id}"
  }
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-00.id}"
  }
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-02.id}"
  }
  image_id = "cc2e31fc-c24d-4905-bb45-1d57794a4f3c"
  flavor_id = "17"
  key_pair = "foucault"
  security_groups = ["icmp-ssh","bgp"]
}

resource "openstack_compute_instance_v2" "tf-bird-01" {
  name = "tf-bird-01"
  region = "fr1"
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-admin.id}"
  }
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-01.id}"
  }
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-03.id}"
  }
  image_id = "cc2e31fc-c24d-4905-bb45-1d57794a4f3c"
  flavor_id = "17"
  key_pair = "foucault"
  security_groups = ["icmp-ssh","bgp"]
}

# Create compute nodes
resource "openstack_compute_instance_v2" "tf-hyp-00" {
  name = "tf-hyp-00"
  region = "fr1"
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-admin.id}"
  }
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-00.id}"
  }
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-01.id}"
  }
  image_id = "cc2e31fc-c24d-4905-bb45-1d57794a4f3c"
  flavor_id = "17"
  key_pair = "foucault"
  security_groups = ["icmp-ssh","bgp"]
}

resource "openstack_compute_instance_v2" "tf-hyp-01" {
  name = "tf-hyp-01"
  region = "fr1"
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-admin.id}"
  }
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-02.id}"
  }
  network {
    uuid = "${openstack_networking_network_v2.tf-net-bgp-lab-usr-03.id}"
  }
  image_id = "cc2e31fc-c24d-4905-bb45-1d57794a4f3c"
  flavor_id = "21"
  key_pair = "foucault"
  security_groups = ["icmp-ssh","bgp"]
}

# Outputs

