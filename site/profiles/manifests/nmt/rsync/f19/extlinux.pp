class profiles::nmt::rsync::f19::extlinux {
  rsync::get { 'extlinux':
    source => "update.nmt.edu::F19-extlinux",
    path => '/boot/extlinux/',
    recursive => true,
    links => true }
}
