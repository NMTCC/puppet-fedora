class profiles::nmt::rsync::stretch::anaconda {

  rsync::get { 'anaconda2':
    source    => 'duplicon.nmt.edu::Stretch-anaconda/anaconda2-4.3.0',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'anaconda3':
    source    => 'duplicon.nmt.edu::Stretch-anaconda/anaconda3-4.3.0',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

}
