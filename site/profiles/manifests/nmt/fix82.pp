# class profiles::nmt::fix82

class profiles::nmt::fix82 {

  exec { 'enablesplay':
    provider => shell,
    command  => 'printf "splay=true\n" >> /etc/puppet/puppet.conf',
    unless   => 'grep splay /etc/puppet/puppet.conf',
  }

  service { 'puppet':
    ensure  => 'running',
    enable  => 'true',
    require => Exec['enablesplay'],
  }

  exec { 'fixdpkg':
    provider => shell,
    command  => 'dpkg --configure -a; true',
    require  => Service['puppet'],
  }

  exec { 'fixcron':
    provider => shell,
    command  => 'apt-get -y install --reinstall cron',
    unless   => 'exit $(dpkg -s cron | grep reinstreq | wc -l)',
    require  => Exec['fixdpkg'],
  }

}
