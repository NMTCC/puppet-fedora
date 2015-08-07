class profiles::nmt::rsync::jessie::anaconda {

  rsync::get { 'anaconda':
    source => 'duplicon.nmt.edu::Jessie-anaconda/anaconda',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

}
