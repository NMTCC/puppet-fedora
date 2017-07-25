# Configure basic stuff
class profile::base {

  file { '/usr/local/libexec':
    ensure => directory,
    owner  => 'root',
    group  => 'staff',
    mode   => '2775',
  }

  file { '/usr/local/share/applications':
    ensure => directory,
    owner  => 'root',
    group  => 'staff',
    mode   => '2775',
  }

  file { '/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => '/fs/tcc/motd/motd',
    require => Service['autofs'],
  }

  file { '/usr/bin/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => "#!/bin/sh\ncat /fs/tcc/motd/motd\n",
  }

  file { '/usr/bin/wall':
    group => 'tty',
    mode  => '0755',
  }

  file_line { 'ctrl-alt-bksp':
    ensure => present,
    path   => '/etc/default/keyboard',
    line   => 'XKBOPTIONS="terminate:ctrl_alt_bksp"',
    match  => '^XKBOPTIONS',
  }

}
