# class profiles::nmt::config::jessie

class profiles::nmt::config::jessie {

  file { '/etc/motd':
    source  => [
      "file:///fs/tcc/motd/motd",
      "file:///etc/motd"
    ],
    mode    => '0644',
    require => [
      Service['autofs'],
      Exec['kinit']
    ]
  }
  file { '/etc/lightdm/scripts': ensure => 'directory', }
  file { '/etc/lightdm/lightdm.conf.d': ensure => 'directory', }
  file { '/etc/X11/xorg.conf.d': ensure => 'directory', }

  configdir { 'profile.d': dest => '/etc', }
  configdir { 'boot': dest => '', }

  configfile { '00-keyboard.conf': dest => '/etc/X11/xorg.conf.d', }
  configfile { 'nmt.cron': dest => '/etc/cron.d', }
  configfile { 'Muttrc.local': dest => '/etc', }
  configfile { 'pine.conf': dest => '/etc', }
  configfile { 'rssh.conf': dest => '/etc', }
  configfile { 'itcf21.png': dest => '/usr/share/backgrounds', }
  configfile { 'client.conf': dest => '/etc/cups', }
  #configfile { 'smartd.conf': dest => '/etc/smartmontools', }
  configfile { '65-iscan.rules': dest => '/lib/udev/rules.d', }
  #configfile { 'apcupsd.conf': dest => '/etc/apcupsd', }
  configfile { 'extlinux.conf': dest => '/boot/extlinux', mode => '0640', }
  configfile { 'lightdm-tcc.conf': dest => '/etc/lightdm/lightdm.conf.d', }
  configfile { 'gnome-software-service.desktop': dest => '/etc/xdg/autostart', }
  configfile { 'media-winpart.mount': dest => '/etc/systemd/system', }
  configfile { 'lightdm-gtk-greeter.conf': dest => '/etc/lightdm', }
  #configfile { 'pcscfg.cfg': dest => '/usr/lib/oracle/12.1/client64/lib/precomp/admin', require => Package['oracle-instantclient12.1-precomp'], }
  #configfile { 'main.cf': dest => '/etc/postfix', }
  #configfile { 'defaults.list': dest => '/usr/share/applications', }
  configfile { 'krb5.conf': dest => '/etc', }
  configfile { 'sssd.conf': dest => '/etc/sssd', mode => '0600', }

  ln { '/usr/local/bin/pine': target => '/usr/bin/alpine', }
  ln { '/usr/local/bin/perl': target => '/usr/bin/perl', }
  ln { '/usr/local/bin/python': target => '/usr/bin/python', }
  ln { '/boot/boot': target => '/boot', require => Configdir['boot'], }
  ln { '/usr/share/xsessions/default.desktop': target => '/usr/share/xsessions/cinnamon.desktop', }
  #ln { '/usr/bin/sqlplus': target => '/usr/lib/oracle/12.1/client64/bin/sqlplus', }

  configscript { 'peripheral_check': dest => '/etc/cron.daily', }
  configscript { 'motd': dest => '/usr/bin', }
  configscript { 'chsh': dest => '/usr/local/bin', }
  configscript { 'set_next_os': dest => '/usr/local/bin', }
  configscript { 'finger-names': dest => '/usr/local/bin', }
  configscript { 'clear_browser_locks': dest => '/usr/local/bin', }
  configscript { 'reset_windows': dest => '/usr/local/bin', }
  configscript { 'reset_linux': dest => '/usr/local/bin', }
  configscript { 'random_machine_reboot': dest => '/usr/local/bin', }
  configscript { 'reboot_to_win': dest => '/usr/local/bin', }
  configscript { 'reapply': dest => '/usr/local/bin', }
  configscript { 'passwd': dest => '/usr/local/bin', }
  configscript { 'jpgmpg': dest => '/usr/local/bin', }
  configscript { 'make_bootusb': dest => '/usr/local/bin', }
  configscript { 'nmt-dracut': dest => '/usr/local/bin', }
  configscript { 'PostLogout': dest => '/etc/lightdm/scripts', }
  configscript { 'sfdisk2parted': dest => '/usr/local/bin', }
  #configscript { 'killpower': dest => '/etc/apcupsd', }
  configscript { 'reseed': dest => '/usr/local/bin', }
  configscript { 'remreboot': dest => '/usr/local/bin', }
  configscript { 'xorg_user': dest => '/usr/local/bin', }
  configscript { 'grub2': dest => '/usr/local/bin', }
  configscript { 'fail2log': dest => '/etc/cron.daily', }
  configscript { 'smartdnotify': dest => '/usr/local/libexec', }

  service { 'cups': ensure => 'running', enable => 'true', require => Configfile['client.conf'], }
  service { 'puppet': ensure => 'stopped', enable => 'false', }
  #service { 'postfix': ensure => 'running', enable => 'true', }
  service { 'sssd': ensure => 'running', enable => 'true', require => Configfile['sssd.conf'], }

  k5login { '/root/.k5login':
    ensure     => 'present',
    principals => [
      'ken@NMT.EDU',
      'dgraham@NMT.EDU',
      'dylan@NMT.EDU',
      'wopr@NMT.EDU',
      'kaiba@NMT.EDU',
    ]
  }

}
