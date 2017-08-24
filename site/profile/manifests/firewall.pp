# Configure firewalld
class profile::firewall {

  class { 'firewalld': }

  firewalld_port { 'Open remctl port in the public zone':
    ensure   => present,
    zone     => 'public',
    port     => 4373,
    protocol => 'tcp',
  }

  firewalld_port { 'Open transmission port in the public zone':
    ensure   => present,
    zone     => 'public',
    port     => 51413,
    protocol => 'tcp',
  }

}
