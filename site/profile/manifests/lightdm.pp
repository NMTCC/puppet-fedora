# Configure LightDM
class profile::lightdm {

  $moduleloc = "puppet:///modules/profile/${::operatingsystem}/${::operatingsystemmajrelease}"

  file { '/etc/lightdm/lightdm.conf.d':
    ensure  => directory,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Package['lightdm-gtk-greeter'],
  }

  file { '/usr/local/libexec/LightDM_PostLogout':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    source  => "${moduleloc}/LightDM_PostLogout",
    require => File['/usr/local/libexec'],
  }

  $nmtlightdm = '/etc/lightdm/lightdm.conf.d/lightdm-nmt.conf'
  $lightdmgreeter = '/etc/lightdm/lightdm-gtk-greeter.conf'

  Ini_setting { key_val_separator => '=', }

  ini_setting {

    'lightdm-allow-user-switching':
      ensure  => present,
      path    => $nmtlightdm,
      section => 'SeatDefaults',
      setting => 'allow-user-switching',
      value   => false,
      require => File['/etc/lightdm/lightdm.conf.d'],;

    'lightdm-greeter-hide-users':
      ensure  => present,
      path    => $nmtlightdm,
      section => 'SeatDefaults',
      setting => 'greeter-hide-users',
      value   => true,
      require => File['/etc/lightdm/lightdm.conf.d'],;

    'lightdm-greeter-allow-guest':
      ensure  => present,
      path    => $nmtlightdm,
      section => 'SeatDefaults',
      setting => 'greeter-allow-guest',
      value   => false,
      require => File['/etc/lightdm/lightdm.conf.d'],;

    'lightdm-user-session':
      ensure  => present,
      path    => $nmtlightdm,
      section => 'SeatDefaults',
      setting => 'user-session',
      value   => 'lightdm-xsession',
      require => File['/etc/lightdm/lightdm.conf.d'],;

    'lightdm-session-cleanup-script':
      ensure  => present,
      path    => $nmtlightdm,
      section => 'SeatDefaults',
      setting => 'session-cleanup-script',
      value   => '/usr/local/libexec/LightDM_PostLogout',
      require => File['/etc/lightdm/lightdm.conf.d'],;

    'lightdm-hidden-users':
      ensure  => present,
      path    => '/etc/lightdm/users.conf',
      section => 'UserList',
      setting => 'hidden-users',
      value   => 'nobody nobody4 noaccess nmtgrubitc nmtgrubact',
      require => Package['lightdm-gtk-greeter'],;

    'lightdm-background':
      ensure  => present,
      path    => $lightdmgreeter,
      section => 'greeter',
      setting => 'background',
      value   => $::splashscreen,
      require => Package['lightdm-gtk-greeter'],;

    'lightdm-show-clock':
      ensure  => present,
      path    => $lightdmgreeter,
      section => 'greeter',
      setting => 'show-clock',
      value   => true,
      require => Package['lightdm-gtk-greeter'],;

    'lightdm-clock-format':
      ensure  => present,
      path    => $lightdmgreeter,
      section => 'greeter',
      setting => 'clock-format',
      value   => '%a %m/%d, %I:%M %p',
      require => Package['lightdm-gtk-greeter'],;

  }

  file { '/usr/share/backgrounds/nmtstretch.png':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "${moduleloc}/nmtstretch.png",
  }

  file { '/etc/alternatives/x-session-manager':
    ensure => link,
    target => '/usr/bin/cinnamon-session',
  }

  file { '/etc/alternatives/x-cursor-theme':
    ensure => link,
    target => '/usr/share/icons/DMZ-Black/cursor.theme',
  }

  service { 'lightdm':
    ensure    => running,
    enable    => true,
    subscribe => [
      Ini_setting[
        'lightdm-allow-user-switching',
        'lightdm-greeter-hide-users',
        'lightdm-greeter-allow-guest',
        'lightdm-user-session',
        'lightdm-session-cleanup-script',
        'lightdm-hidden-users',
        'lightdm-background',
        'lightdm-show-clock',
        'lightdm-clock-format',
      ],
      File['/usr/share/backgrounds/nmtstretch.png'],
    ],
  }

  rsync::get { 'wallpapers':
    source    => 'userhost.nmt.edu::wallpapers',
    path      => '/usr/share/backgrounds/nmt',
    recursive => true,
    links     => true,
    times     => true,
  }

}
