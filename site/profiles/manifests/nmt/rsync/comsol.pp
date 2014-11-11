class profiles::nmt::rsync::comsol {
  rsync::get { 'comsol':
    source => "update.nmt.edu::F19-comsol",
    path => '/',
    recursive => true,
    links => true }
}
