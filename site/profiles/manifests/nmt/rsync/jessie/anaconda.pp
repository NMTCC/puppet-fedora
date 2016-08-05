class profiles::nmt::rsync::jessie::anaconda {

  exec { 'anaconda-2.3.0':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /usr/local/anaconda',
    onlyif  => 'test -e /usr/local/anaconda',
  }

  rsync::get { 'anaconda2':
    source    => 'duplicon.nmt.edu::Jessie-anaconda/anaconda2-4.1.1',
    path      => '/usr/local/anaconda2',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'anaconda3':
    source    => 'duplicon.nmt.edu::Jessie-anaconda/anaconda3-4.1.1',
    path      => '/usr/local/anaconda3',
    recursive => true,
    links     => true,
    times     => true,
  }

}
