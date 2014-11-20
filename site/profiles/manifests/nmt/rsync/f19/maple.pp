class profiles::nmt::rsync::f19::maple {

  rsync::get { 'maple':
    source => 'update.nmt.edu::F19-maple/usr/local/maple17',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'maple-desktop':
    source => 'update.nmt.edu::F19-maple/usr/local/share/applications/maple17.desktop',
    path => '/usr/local/share/applications/',
    times => true,
  }

  file { '/usr/local/bin/maple':
    ensure => 'link',
    target => '/usr/local/maple17/bin/maple',
    require => Rsync::Get['maple'],
  }

  file { '/usr/local/bin/xmaple':
    ensure => 'link',
    target => '/usr/local/maple17/bin/xmaple',
    require => Rsync::Get['maple'],
  }

}
