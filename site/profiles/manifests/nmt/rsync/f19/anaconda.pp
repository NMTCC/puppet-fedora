class profiles::nmt::rsync::f19::anaconda {

  rsync::get { 'anaconda':
    source => 'update.nmt.edu::F19-anaconda/usr/local/anaconda',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

}
