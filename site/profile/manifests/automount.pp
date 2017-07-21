# Configure autofs
class profile::automount {

  $moduleloc = "puppet:///modules/profile/${::operatingsystem}/${::operatingsystemmajrelease}"

  file {

    '/usr/local/libexec/auto.home':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      source  => "${moduleloc}/auto.home",
      require => File['/usr/local/libexec'],;

    '/usr/local/libexec/auto.fs':
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0755',
      source  => "${moduleloc}/auto.fs",
      require => File['/usr/local/libexec'],;

  }

  include autofs

  autofs::mount {

    'u':
      mount          => '/u',
      mapfile        => 'program:/usr/local/libexec/auto.home',
      mapfile_manage => false,
      options        => '--timeout=60',
      order          => 01,
      require        => File['/usr/local/libexec/auto.home'],;

    'fs':
      mount          => '/fs',
      mapfile        => 'program:/usr/local/libexec/auto.fs',
      mapfile_manage => false,
      options        => '--timeout=60',
      order          => 02,
      require        => File['/usr/local/libexec/auto.fs'],;

  }

}
