class profiles::nmt::rsync::jessie::maple {

  exec { 'maple18':
    path => '/bin:/usr/bin/',
    command => 'rm -rf /usr/local/maple18',
    onlyif => 'test -e /usr/local/maple18',
  }

  rsync::get { 'maple':
    source => 'duplicon.nmt.edu::Jessie-maple/maple2015',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'maple-desktop':
    source => 'duplicon.nmt.edu::Jessie-maple/maple.desktop',
    path => '/usr/local/share/applications/',
    times => true,
  }

  file { '/usr/local/bin/maple':
    ensure => 'link',
    target => '/usr/local/maple2015/bin/maple',
    require => Rsync::Get['maple'],
  }

  file { '/usr/local/bin/xmaple':
    ensure => 'link',
    target => '/usr/local/maple2015/bin/xmaple',
    require => Rsync::Get['maple'],
  }

}
