# rsync extlinux
class profile::rsync::extlinux {

  file { '/boot/extlinux':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/boot/extlinux/extlinux.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    source  => '',
    require => File['/boot/extlinux'],
  }

  rsync::get { 'extlinux':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-extlinux",
    path      => '/boot/extlinux/',
    recursive => true,
    links     => true,
    times     => true,
    require   => File['/boot/extlinux/extlinux.conf'],
  }

  exec { 'extlinux-modules':
    provider => shell,
    command  => 'rsync -aqc /usr/lib/syslinux/modules/bios/ /boot/extlinux/',
    unless   => 'exit $(rsync -avnc /usr/lib/syslinux/modules/bios/ /boot/extlinux/ | grep c32 | wc -l)',
    require  => [
      File['/boot/extlinux/extlinux.conf'],
      Package['syslinux-common'],
    ],
  }

  exec { 'memdisk':
    provider => shell,
    command  => 'rsync -aqc /usr/lib/syslinux/memdisk /boot/extlinux/',
    unless   => 'exit $(diff /usr/lib/syslinux/memdisk /boot/extlinux/memdisk 2>&1 | wc -l)',
    require  => [
      File['/boot/extlinux/extlinux.conf'],
      Package['syslinux-common'],
    ],
  }

}
