class profiles::nmt::rsync::f19::logo {

  rsync::get { 'netlogo':
    source => 'update.nmt.edu::F19-logo/netlogo-5.1.0',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'starlogo':
    source => 'update.nmt.edu::F19-logo/starlogo-2.2',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'netlogo-bin':
    source => 'update.nmt.edu::F19-logo/bin/netlogo',
    path => '/usr/local/bin/',
    times => true,
  }

  rsync::get { 'starlogo-bin':
    source => 'update.nmt.edu::F19-logo/bin/starlogo',
    path => '/usr/local/bin/',
    times => true,
  }

}
