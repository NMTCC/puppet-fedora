# Configure GRUB2
class profile::grub {

  $moduleloc =
    "puppet:///modules/profile/${::operatingsystem}/${::operatingsystemmajrelease}"

  user {

    'nmtgrubitc':
      ensure   => present,
      password => hiera('grubpasswd'),
      system   => true,;

    'nmtgrubact':
      ensure   => present,
      password => hiera('actgrubpasswd'),
      system   => true,;

  }

  file { 'nmt-grub-theme':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    path    => '/boot/grub/themes',
    source  => "${moduleloc}/grub-themes",
    recurse => true,
    links   => 'manage',
  }

  file { '/usr/local/bin/grub2':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => "${moduleloc}/grub2",
    require => [
      File['nmt-grub-theme'],
      User['nmtgrubitc'],
      User['nmtgrubact'],
    ],
  }

}
