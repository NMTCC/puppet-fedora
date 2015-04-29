class profiles::nmt::rsync::jessie::extlinux {

  rsync::get { 'extlinux':
    source => 'update.nmt.edu::Jessie-extlinux',
    path => '/boot/extlinux/',
    recursive => true,
    links => true,
    times => true,
  }

  exec { 'extlinux-modules':
    provider => shell,
    command  => 'rsync -aqc /usr/lib/syslinux/modules/bios/ /boot/extlinux/',
    onlyif   => 'test $(rsync -avnc /usr/lib/syslinux/modules/bios/ /boot/extlinux/ | grep c32 | wc -l) -gt 0',
  }

  exec { 'memdisk':
    provider => shell,
    command  => 'rsync -aqc /usr/lib/syslinux/memdisk /boot/extlinux/',
    onlyif   => 'diff /usr/lib/syslinux/memdisk /boot/extlinux/memdisk',
  }

}
