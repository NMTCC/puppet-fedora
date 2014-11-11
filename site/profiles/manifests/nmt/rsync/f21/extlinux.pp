class profiles::nmt::rsync::f21::extlinux {
  rsync::get { 'extlinux':
    source => "update.nmt.edu::F21-extlinux",
    path => '/boot/extlinux/',
    recursive => true,
    links => true }
}
