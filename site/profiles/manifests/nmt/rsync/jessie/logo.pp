class profiles::nmt::rsync::jessie::logo {

  rsync::get { 'netlogo':
    source    => 'duplicon.nmt.edu::Jessie-logo/netlogo-5.2.0',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'starlogo':
    source    => 'duplicon.nmt.edu::Jessie-logo/starlogo-2.2',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'netlogo-bin':
    source  => 'duplicon.nmt.edu::Jessie-logo/netlogo',
    path    => '/usr/local/bin/',
    times   => true,
    require => Rsync::Get['netlogo'],
  }

  rsync::get { 'starlogo-bin':
    source  => 'duplicon.nmt.edu::Jessie-logo/starlogo',
    path    => '/usr/local/bin/',
    times   => true,
    require => Rsync::Get['starlogo'],
  }

}
