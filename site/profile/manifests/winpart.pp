# Configure Windows mount
class profile::winpart {

  $moduleloc =
    "puppet:///modules/profile/${::operatingsystem}/${::operatingsystemmajrelease}"

  if $::template == 'dual-boot' {

    file { '/etc/systemd/system/media-winpart.mount':
      ensure => file,
      owner  => 'root',
      group  => 'root',
      mode   => '0644',
    }

    Ini_setting {
      ensure            => present,
      path              => '/etc/systemd/system/media-winpart.mount',
      key_val_separator => '=',
      require           => File['/etc/systemd/system/media-winpart.mount'],
    }

    ini_setting {

      'winpart-description':
        section => 'Unit',
        setting => 'Description',
        value   => 'Windows partition',;

      'winpart-partition':
        section => 'Mount',
        setting => 'What',
        value   => '/dev/sda2',;

      'winpart-mountpoint':
        section => 'Mount',
        setting => 'Where',
        value   => '/media/winpart',;

      'winpart-type':
        section => 'Mount',
        setting => 'Type',
        value   => 'ntfs',;

      'winpart-options':
        section => 'Mount',
        setting => 'Options',
        value   => 'rw',;

      'winpart-timeout':
        section => 'Mount',
        setting => 'TimeoutSec',
        value   => '5',;

    }

    exec { 'winpart-daemon-reload':
      command     => 'systemctl daemon-reload',
      subscribe   => File['/etc/systemd/system/media-winpart.mount'],
      refreshonly => true,
    }

    file { '/usr/local/libexec/fix-windows':
      ensure  => file,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      source  => "${moduleloc}/fix-windows",
      require => File['/usr/local/libexec'],
    }

  }

}
