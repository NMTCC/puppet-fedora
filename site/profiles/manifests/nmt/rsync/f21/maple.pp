class profiles::nmt::rsync::f21::maple {

  file { 'maple17':
    ensure => 'absent',
    path => '/usr/local/maple17',
    recurse => true,
    purge => true,
    force => true,
  }

  rsync::get { 'maple':
    source => 'update.nmt.edu::F21-maple/maple18',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'maple-desktop':
    source => 'update.nmt.edu::F21-maple/maple.desktop',
    path => '/usr/local/share/applications/',
    times => true,
  }

  file { '/usr/local/bin/maple':
    ensure => 'link',
    target => '/usr/local/maple18/bin/maple',
    require => Rsync::Get['maple'],
  }

  file { '/usr/local/bin/xmaple':
    ensure => 'link',
    target => '/usr/local/maple18/bin/xmaple',
    require => Rsync::Get['maple'],
  }

}
