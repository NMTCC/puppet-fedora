class profiles::nmt::rsync::f19::f21ks {

  file { '21ks':
    path => '/boot/extlinux/images/21',
    ensure => 'directory',
  }

  rsync::get { 'vmlinuz':
    source => 'update.nmt.edu::F21-isolinux/vmlinuz',
    path => '/boot/extlinux/images/21/',
    times => true,
    require => File['21ks'],
  }

  rsync::get { 'initrd':
    source => 'update.nmt.edu::F21-isolinux/initrd.img',
    path => '/boot/extlinux/images/21/',
    times => true,
    require => File['21ks'],
  }

}
