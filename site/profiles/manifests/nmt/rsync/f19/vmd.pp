class profiles::nmt::rsync::f19::vmd {

  rsync::get { 'vmd':
    source => 'update.nmt.edu::F19-vmd/usr/local/lib/vmd',
    path => '/usr/local/lib/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'vmd-bin':
    source => 'update.nmt.edu::F19-vmd/usr/local/bin/vmd',
    path => '/usr/local/bin/',
    times => true,
  }

}
