# class profiles::nmt::apt

class profiles::nmt::apt {

  define aptsource ($type, $uri, $suite, $comp) {
    file { "/etc/apt/sources.list.d/${title}.list" :
      ensure  => 'file',
      content => "${type} ${uri} ${suite} " + join($comp, ' '),
      group   => 'root',
      mode    => '0644',
      owner   => 'root',
    }
  }

  define rmaptsource {
    file { "/etc/apt/sources.list.d/${title}.list" :
      ensure => 'absent',
      force  => 'true',
      backup => 'false',
    }
  }

  define aptkeyfromweb ($uri) {
    exec { "add-${title}-key":
      provider => 'shell',
      command  => "wget -q -O- ${uri} | apt-key --keyring /etc/apt/trusted.gpg.d/${title}.gpg add -",
      unless   => "test -e /etc/apt/trusted.gpg.d/${title}.gpg",
    }
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
