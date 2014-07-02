resources { "firewall":
  purge => true
}

Firewall {
  before  => Class['firewall::post'],
  require => Class['firewall::pre'],
}

class { ['firewall::pre', 'firewall::post']: }

class { 'firewall': }

class firewall::pre {
  Firewall {
    require => undef,
  }

  firewall { '000 accept all icmp':
    proto  => 'icmp',
    action => 'accept',
  }->
  firewall { '001 accept all to lo interface':
    proto   => 'all'
    iniface => 'lo',
    action  => 'accept',
  }->
  firewall { '002 accept related established rules':
    proto   => 'all',
    ctstate => ['RELATED', 'ESTABLISHED'],
    action  => 'accept',
  }

  class firewall::post {
    firewall { '999 drop all':
      proto   => 'all',
      action  => 'drop',
      before  => undef,
    }
  }
}
