class profiles::nmt::rsync::extlinux {
  rsync::get { 'extlinux':
    source => "update.nmt.edu::F19-extlinux",
    path => '/boot/extlinux/' }
}
