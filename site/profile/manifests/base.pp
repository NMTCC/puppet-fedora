# Configure basic stuff
class profile::base {

  $moduleloc =
    "puppet:///modules/profile/${::operatingsystem}/${::operatingsystemmajrelease}"

  file { '/usr/local/libexec':
    ensure => directory,
    owner  => 'root',
    group  => 'staff',
    mode   => '2775',
  }

  file { '/usr/local/share/applications':
    ensure => directory,
    owner  => 'root',
    group  => 'staff',
    mode   => '2775',
  }

  file { '/etc/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => '/fs/tcc/motd/motd',
    require => Service['autofs'],
  }

  file { '/usr/bin/motd':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => "#!/bin/sh\ncat /fs/tcc/motd/motd\n",
  }

  Ini_setting {
    ensure            => present,
    key_val_separator => '=',
    path              => '/etc/xdg/autostart/xmotd.desktop',
    section           => 'Desktop Entry',
  }

  ini_setting {

    'xmotd-dt-version':
      setting => 'Version',
      value   => '1.0',;

    'xmotd-dt-name':
      setting => 'Name',
      value   => 'xmotd',;

    'xmotd-dt-comment':
      setting => 'Comment',
      value   => 'NMT Message of the Day',;

    'xmotd-dt-exec':
      setting => 'Exec',
      value   => '/usr/local/bin/xmotd',;

    'xmotd-dt-icon':
      setting => 'Icon',
      value   => 'utilities-terminal',;

    'xmotd-dt-terminal':
      setting => 'Terminal',
      value   => false,;

    'xmotd-dt-type':
      setting => 'Type',
      value   => 'Application',;

    'xmotd-dt-startup':
      setting => 'StartupNotify',
      value   => false,;

    'xmotd-dt-categories':
      setting => 'Categories',
      value   => 'Applications',;

  }

  file { '/usr/bin/wall':
    group => 'tty',
    mode  => '0755',
  }

  file_line { 'ctrl-alt-bksp':
    ensure => present,
    path   => '/etc/default/keyboard',
    line   => 'XKBOPTIONS="terminate:ctrl_alt_bksp"',
    match  => '^XKBOPTIONS',
  }

  file { '/etc/network/interfaces':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content =>
      "source /etc/network/interfaces.d/*\nauto lo\niface lo inet loopback\n",
  }

  file { '/etc/profile.d/nmt-prompt.sh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "if [ \"\$PS1\" ]\nthen\n\tPS1=\"[\\u@\\h \\W]\\\\\$ \"\nfi\n",
  }

  file { '/etc/csh/login.d/nmt-prompt.csh':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "if (\$?prompt) then\n\tset prompt = '[%n@%m %~]%# '\nendif\n",
  }

  ini_setting { 'disable-gnome-software':
    ensure            => present,
    path              => '/etc/xdg/autostart/gnome-software-service.desktop',
    section           => 'Desktop Entry',
    key_val_separator => '=',
    setting           => 'X-GNOME-Autostart-enabled',
    value             => false,
    require           => Package['gnome'],
  }

  file { '/usr/bin/sl':
    ensure  => link,
    target  => '/usr/games/sl',
    require => Package['sl'],
  }

  file { '/lib/udev/rules.d/65-iscan.rules':
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "${moduleloc}/65-iscan.rules",
  }

  user { 'root':
    ensure   => present,
    password => hiera('linuxpasswd'),
    system   => true,
  }

}
