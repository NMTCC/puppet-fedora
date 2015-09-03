# class profiles::nmt::firewall

class profiles::nmt::firewall {

  define firewalldopen ($zone) {
    exec { "open port ${title}":
      command => "/usr/bin/firewall-cmd --zone=${zone} --add-port ${title} --permanent && /usr/bin/firewall-cmd --reload",
      unless => "/usr/bin/firewall-cmd --zone=${zone} --list-ports | grep ${title}",
    }
  }

  define firewalldclose ($zone) {
    exec { "close port ${title}":
      command => "/usr/bin/firewall-cmd --zone=${zone} --remove-port ${title} --permanent && /usr/bin/firewall-cmd --reload",
      onlyif => "/usr/bin/firewall-cmd --zone=${zone} --list-ports | grep ${title}",
    }
  }

  case $::operatingsystemmajrelease {
    '8': {
      class { "profiles::nmt::firewall::jessie": }
    }
    default: {
      warning('No firewall rules for this release version.')
    }
  }

}
