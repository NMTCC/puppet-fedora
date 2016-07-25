class profiles::nmt::rsync::jessie::maple {

  exec { 'maple2015':
    path => '/bin:/usr/bin/',
    command => 'rm -rf /usr/local/maple2015',
    onlyif => 'test -e /usr/local/maple2015',
  }

  rsync::get { 'maple':
    source => 'duplicon.nmt.edu::Jessie-maple/maple2016',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'maple-desktop':
    source => 'duplicon.nmt.edu::Jessie-maple/maple2016.desktop',
    path => '/usr/local/share/applications/maple.desktop',
    times => true,
  }

  file { '/usr/local/bin/maple':
    ensure => 'link',
    target => '/usr/local/maple2016/bin/maple',
    require => Rsync::Get['maple'],
  }

  file { '/usr/local/bin/xmaple':
    ensure => 'link',
    target => '/usr/local/maple2016/bin/xmaple',
    require => Rsync::Get['maple'],
  }

}
