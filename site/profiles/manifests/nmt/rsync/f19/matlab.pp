class profiles::nmt::rsync::f19::matlab {
  rsync::get { 'matlab':
    source => "update.nmt.edu::F19-matlab",
    path => '/',
    recursive => true,
    links => true }
}
