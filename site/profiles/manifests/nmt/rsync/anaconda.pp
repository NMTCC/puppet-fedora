class profiles::nmt::rsync::anaconda {
  rsync::get { 'anaconda':
    source => "update.nmt.edu::F19-anaconda",
    path => '/',
    recursive => true,
    links => true }
}
