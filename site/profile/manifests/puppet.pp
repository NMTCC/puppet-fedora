# Configure puppet
class profile::puppet {

  if $::chroot {

    service { 'puppet':
      ensure => stopped,
      enable => true,
    }

  }
  else {

    service { 'puppet':
      ensure  => running,
      enable  => true,
      require => [
        Ini_setting['caserver'],
        Ini_setting['puppetserver'],
        Ini_setting['environment'],
        Ini_setting['splay'],
      ],
    }

  }

  ini_setting {

    'caserver':
      ensure  => present,
      path    => '/etc/puppet/puppet.conf',
      section => 'main',
      setting => 'ca_server',
      value   => 'puppet4-server.nmt.edu',;

    'puppetserver':
      ensure  => present,
      path    => '/etc/puppet/puppet.conf',
      section => 'agent',
      setting => 'server',
      value   => 'puppet4-linux.nmt.edu',;

    'environment':
      ensure  => present,
      path    => '/etc/puppet/puppet.conf',
      section => 'agent',
      setting => 'environment',
      value   => $::environment,;

    'splay':
      ensure  => present,
      path    => '/etc/puppet/puppet.conf',
      section => 'agent',
      setting => 'splay',
      value   => true,;

  }

}
