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

  file { '/etc/postfix/main.cf':
    content => template("profiles/main.cf.erb"),
    require => Package['postfix'],
  }

  file { '/etc/aliases':
    source => 'puppet:///modules/profiles/postfix/aliases'
  }

  file { '/etc/mailname':
    content => "nmt.edu",
  }

  service { 'postfix':
    ensure    => 'running',
    enable    => 'true',
    subscribe => File['/etc/postfix/main.cf'],
  }

}
