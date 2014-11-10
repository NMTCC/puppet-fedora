class profiles::nmt::rsync::logo {
  rsync::get { 'logo':
    source => "update.nmt.edu::F19-logo",
    path => '/usr/local/' }
}
