class profiles::nmt::rsync::f21::iris {

  rsync::get { 'cwp':
    source => 'update.nmt.edu::F21-iris/cwp',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'oss':
    source => 'update.nmt.edu::F21-iris/oss',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'iris-sh':
    source => 'update.nmt.edu::F21-iris/iris.sh',
    path => '/etc/profile.d/',
    times => true,
    require => [ Rsync::Get['cwp'], Rsync::Get['oss'] ],
  }

  rsync::get { 'iris-csh':
    source => 'update.nmt.edu::F21-matlab/iris.csh',
    path => '/etc/profile.d/',
    times => true,
    require => [ Rsync::Get['cwp'], Rsync::Get['oss'] ],
  }

}
