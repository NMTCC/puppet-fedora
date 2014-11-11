class profiles::nmt::rsync::f19::vmd {
  rsync::get { 'vmd':
    source => "update.nmt.edu::F19-vmd",
    path => '/',
    recursive => true,
    links => true }
}
