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

  file { 'grubtheme':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    path    => '/boot',
    source  => "${moduleloc}/boot",
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
      File['grubtheme'],
      User['nmtgrubitc'],
      User['nmtgrubact'],
    ],
  }

}
