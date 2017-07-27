# Configure Transmission
class profile::transmission {

  service { 'transmission-daemon':
    ensure  => stopped,
    enable  => false,
    require => Package['transmission-daemon'],
  }

  file { '/var/lib/transmission-daemon/downloads':
    ensure  => directory,
    owner   => 'debian-transmission',
    group   => 'debian-transmission',
    mode    => '4775',
    require => Package['transmission-daemon'],
  }

  file { '/var/lib/transmission-daemon/downloads/incomplete':
    ensure  => directory,
    owner   => 'debian-transmission',
    group   => 'debian-transmission',
    mode    => '4775',
    require => Package['transmission-daemon'],
  }

}
