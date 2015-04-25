# class profiles::nmt::postfix

class profiles::nmt::postfix {

  package { 'postfix':
    ensure => $ensure,
  }

  File {
    ensure  => $ensure,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
  }

  file { '/etc/postfix':
    ensure  => $ensure ? {
                  present => directory,
                  default => absent,
                },
    require => Package['postfix'],
  }

  file { '/etc/postfix/main.cf':
    content => template("profiles/main.cf.erb"),
    require => File['/etc/postfix'],
  }

  file { '/etc/aliases':
    source => 'puppet:///modules/profiles/postfix/aliases'
  }

  file { '/etc/mailname':
    ensure  => 'file',
    content => "nmt.edu",
  }

}
