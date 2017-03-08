# class profiles::nmt::apt

class profiles::nmt::apt {

  define aptsource ($type, $uri, $suite, $comp) {
    $scomp = join($comp, ' ')
    file { "/etc/apt/sources.list.d/${title}.list" :
      ensure  => 'file',
      content => "${type} ${uri} ${suite} ${scomp}",
      group   => 'root',
      mode    => '0644',
      owner   => 'root',
      before  => Exec['apt-update'],
    }
  }

  define rmaptsource {
    file { "/etc/apt/sources.list.d/${title}.list" :
      ensure => 'absent',
      force  => 'true',
      backup => 'false',
      before  => Exec['apt-update'],
    }
  }

  define aptkeyfromweb ($uri) {
    exec { "add-${title}-key":
      provider => 'shell',
      command  => "wget -q -O- ${uri} | apt-key --keyring /etc/apt/trusted.gpg.d/${title}.gpg add -",
      unless   => "test -e /etc/apt/trusted.gpg.d/${title}.gpg",
    }
  }

  file { '/etc/apt/apt.conf.d/99nmt':
    ensure  => 'file',
    content => 'Acquire::Languages "none";',
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
  }

  case $::operatingsystemmajrelease {
    '8': {
      class { "profiles::nmt::apt::jessie": }
    }
    default: {
      warning('No repositories for this release version.')
    }
  }

}
