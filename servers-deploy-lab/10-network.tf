# Networks creation
resource "openstack_networking_network_v2" "lab-00-north" {
  name           = "lab-00-north"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "lab-00-subnet-north" {
  network_id = "${openstack_networking_network_v2.lab-00-north.id}"
  cidr       = "10.128.0.0/24"
  ip_version = 4
}

# Floatingips creation
resource "openstack_networking_floatingip_v2" "lab-00-floating-00" {
  pool = "public"
}

resource "openstack_networking_floatingip_v2" "lab-00-floating-01" {
  pool = "public"
}

# Router creation


#resource "openstack_networking_router_v2" "tf-router-00" {


#  name = "tf-router-00"


#  admin_state_up = "true"


#  external_gateway = "6ea98324-0f14-49f6-97c0-885d1b8dc517"


#}


#resource "openstack_networking_router_interface_v2" "tf-router-north" {


#    router_id = "${openstack_networking_router_v2.tf-router-00.id}"


#    subnet_id = "${openstack_networking_subnet_v2.tf-subnet-north.id}"


#}

