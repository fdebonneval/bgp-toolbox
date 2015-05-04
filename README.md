# bpg-toolbox
My note-taking repo, no idea what I'll do with it

# Links to save
* https://github.com/dbarrosop/sir
* http://www.pmacct.net/
* http://www.pmacct.net/Lucente_collecting_netflow_with_pmacct_v1.2.pdf
* http://bsdrp.net/documentation/examples/how_to_build_a_bsdrp_router_lab
* http://www.freebsd.org/doc/en/articles/nanobsd/howto.html
* http://ipexptobe.blogspot.fr/2011/09/bgp-neighbor-states_15.html

# Examples
* https://www.m00nie.com/2014/01/bgp-rtbh-setup-using-exabgp/
  * BGP RTBH setup using exaBGP
* http://vincent.bernat.im/en/blog/2013-exabgp-highavailability.html
  * Great example (from 2013) of L3 to the host routing
* http://bsdrp.net/documentation/examples
  * Thanks for the examples

# Ansible commands reference
* Getting all informations and variables usable on nodes (facts)
  * http://docs.ansible.com/playbooks_variables.html
  * ansible bgp-lab -m setup
* Getting all node status with ansible ping
  * ansible bgp-lab -m ping

# Exabgp command reference
 announce route 1.0.0.0/21 next-hop 101.1.101.1 med 200 community [2:1] split /23'
