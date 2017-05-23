class profiles::nmt::rsync::jessie::iris {

  exec { 'cwp-44':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /usr/local/cwp',
    onlyif  => 'test -e /usr/local/cwp',
  }

  rsync::get { 'cwp-44r5':
    source => 'duplicon.nmt.edu::Jessie-iris/cwp-44r5',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  exec { 'oss':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /usr/local/oss',
    onlyif  => 'test -e /usr/local/oss',
  }

  rsync::get { 'oss-2.03':
    source => 'duplicon.nmt.edu::Jessie-iris/oss-2.03',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'xmax-2.0.7':
    source    => 'duplicon.nmt.edu::Jessie-iris/xmax-2.0.7',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'iris-sh':
    source => 'duplicon.nmt.edu::Jessie-iris/iris.sh',
    path => '/etc/profile.d/',
    times => true,
    require => [ Rsync::Get['cwp-44r5'], Rsync::Get['oss-2.03'] ],
  }

  rsync::get { 'iris-csh':
    source => 'duplicon.nmt.edu::Jessie-iris/iris.csh',
    path => '/etc/profile.d/',
    times => true,
    require => [ Rsync::Get['cwp-44r5'], Rsync::Get['oss-2.03'] ],
  }

}
