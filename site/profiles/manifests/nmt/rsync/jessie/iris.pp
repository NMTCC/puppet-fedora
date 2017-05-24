class profiles::nmt::rsync::jessie::iris {

  exec { 'cwp-44':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /usr/local/cwp',
    onlyif  => 'test -e /usr/local/cwp',
  }

  exec { 'oss':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /usr/local/oss',
    onlyif  => 'test -e /usr/local/oss',
  }

}
