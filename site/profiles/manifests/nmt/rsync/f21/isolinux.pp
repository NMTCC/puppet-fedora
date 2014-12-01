class profiles::nmt::rsync::f21::isolinux {

  rsync::get { 'vmlinuz':
    source => 'update.nmt.edu::F21-isolinux/vmlinuz',
    path => '/boot/extlinux/images/',
    times => true,
  }

  rsync::get { 'initrd':
    source => 'update.nmt.edu::F21-isolinux/initrd.img',
    path => '/boot/extlinux/images/',
    times => true,
  }

}
