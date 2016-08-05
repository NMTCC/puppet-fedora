class profiles::nmt::rsync::jessie::logo {

  exec { 'netlogo-5.2.0':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /usr/local/netlogo-5.2.0',
    onlyif  => 'test -e /usr/local/netlogo-5.2.0',
  }

  exec { 'netlogo-5.2.0-bin':
    path    => '/bin:/usr/bin',
    command => 'rm -f /usr/local/bin/netlogo',
    onlyif  => 'test -e /usr/local/bin/netlogo',
  }

  rsync::get { 'netlogo':
    source    => 'duplicon.nmt.edu::Jessie-logo/netlogo-5.3.1-64',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'netlogo-sh':
    source  => 'duplicon.nmt.edu::Jessie-logo/netlogo-5.3.1-64.sh',
    path    => '/etc/profile.d/netlogo.sh',
    times   => true,
    require => Rsync::Get['netlogo'],
  }

  rsync::get { 'netlogo-csh':
    source  => 'duplicon.nmt.edu::Jessie-logo/netlogo-5.3.1-64.csh',
    path    => '/etc/profile.d/netlogo.csh',
    times   => true,
    require => Rsync::Get['netlogo'],
  }

  rsync::get { 'starlogo':
    source    => 'duplicon.nmt.edu::Jessie-logo/starlogo-2.2',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'starlogo-bin':
    source  => 'duplicon.nmt.edu::Jessie-logo/starlogo',
    path    => '/usr/local/bin/',
    times   => true,
    require => Rsync::Get['starlogo'],
  }

}
