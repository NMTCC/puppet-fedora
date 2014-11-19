class profiles::nmt::rsync::f19::logo {
  rsync::get { 'logo':
    source => "update.nmt.edu::F19-logo",
    path => '/usr/local/',
    recursive => true }
}
