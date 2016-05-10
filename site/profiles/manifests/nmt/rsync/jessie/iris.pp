class profiles::nmt::rsync::jessie::iris {

  rsync::get { 'cwp':
    source => 'duplicon.nmt.edu::Jessie-iris/cwp',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'oss':
    source => 'duplicon.nmt.edu::Jessie-iris/oss',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'iris-sh':
    source => 'duplicon.nmt.edu::Jessie-iris/iris.sh',
    path => '/etc/profile.d/',
    times => true,
    require => [ Rsync::Get['cwp'], Rsync::Get['oss'] ],
  }

  rsync::get { 'iris-csh':
    source => 'duplicon.nmt.edu::Jessie-iris/iris.csh',
    path => '/etc/profile.d/',
    times => true,
    require => [ Rsync::Get['cwp'], Rsync::Get['oss'] ],
  }

}
