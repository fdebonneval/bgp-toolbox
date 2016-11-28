# Create front server
resource "openstack_compute_instance_v2" "lab-00-00" {
  name   = "lab-00-00"
  region = "fr1"

  network {
    uuid = "${openstack_networking_network_v2.lab-00-north.id}"
  }

  floating_ip = "lab-00-floating-00"
  image_id    = "615d6726-4ca7-44ee-b65c-93c9d8967d22"

  flavor_id = "42"

  key_pair = "foucault"

  security_groups = ["lab-00-icmp-ssh", "sg-80-443", "sg-179"]
}
