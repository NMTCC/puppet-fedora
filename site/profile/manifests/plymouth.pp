# Configure plymouth
class profile::plymouth {

  file { '/etc/initramfs-tools/modules':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "drm\ni915 modeset=1\nnouveau modeset=1\n",
  }

  ini_setting {

    'plymouth-theme':
      ensure  => present,
      path    => '/etc/plymouth/plymouthd.conf',
      section => 'Daemon',
      setting => 'Theme',
      value   => 'joy',
      require => Package['plymouth-themes'],;

    'plymouth-delay':
      ensure  => present,
      path    => '/etc/plymouth/plymouthd.conf',
      section => 'Daemon',
      setting => 'ShowDelay',
      value   => '0',
      require => Package['plymouth-themes'],;

  }

  exec { 'plymouth-update':
    command     => 'update-initramfs -u',
    subscribe   => [
      File['/etc/initramfs-tools/modules'],
      Ini_setting['plymouth-theme'],
      Ini_setting['plymouth-delay'],
    ],
    refreshonly => true,
  }

}
