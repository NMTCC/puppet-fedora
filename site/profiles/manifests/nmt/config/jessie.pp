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
  file { '/etc/lightdm': ensure                  => 'directory', }
  file { '/etc/lightdm/scripts': ensure          => 'directory', }
  file { '/etc/lightdm/lightdm.conf.d': ensure   => 'directory', }
  file { '/etc/X11/xorg.conf.d': ensure          => 'directory', }
  file { '/usr/local/libexec': ensure            => 'directory', }
  file { '/etc/auto.master.d': ensure            => 'directory', }
  file { '/usr/local/share/applications': ensure => 'directory', }

  file { '/var/lib/transmission-daemon/downloads':
    mode    => '4755',
    owner   => 'debian-transmission',
    group   => 'debian-transmission',
    ensure  => 'directory',
    require => Package['transmission-daemon'],
  }
  file { '/var/lib/transmission-daemon/downloads/incomplete':
    mode   => '4755',
    owner  => 'debian-transmission',
    group  => 'debian-transmission',
    ensure => 'directory',
    require => Package['transmission-daemon'],
  }

  configdir { 'profile.d': dest => '/etc', }
  configdir { 'boot': dest => '', }

  configfile { '00-keyboard.conf': dest => '/etc/X11/xorg.conf.d', }
  configfile { 'nmt-crons': dest => '/etc/cron.d', }
  configfile { 'nmtmutt.rc': dest => '/etc/Muttrc.d', }
  configfile { 'pine.conf': dest => '/etc', }
  configfile { 'rssh.conf': dest => '/etc', }
  configfile { 'itcjessie.png': dest => '/usr/share/backgrounds', }
  configfile { 'client.conf': dest => '/etc/cups', }
  configfile { 'smartd.conf': dest => '/etc', }
  configfile { '65-iscan.rules': dest => '/lib/udev/rules.d', }
  configfile { 'apcupsd.conf': dest => '/etc/apcupsd', }
  configfile { 'extlinux.conf': dest => '/boot/extlinux', mode => '0640', }
  configfile { 'user@.service': dest => '/lib/systemd/system', }
  configfile { 'lightdm-tcc.conf': dest => '/etc/lightdm/lightdm.conf.d', }
  configfile { 'gnome-software-service.desktop': dest => '/etc/xdg/autostart', }
  configfile { 'media-winpart.mount': dest => '/etc/systemd/system', }
  configfile { 'lightdm-gtk-greeter.conf': dest => '/etc/lightdm', }
  #configfile { 'pcscfg.cfg': dest => '/usr/lib/oracle/12.1/client64/lib/precomp/admin', require => Package['oracle-instantclient12.1-precomp'], }
  configfile { 'krb5.conf': dest => '/etc', }
  configfile { 'sssd.conf': dest => '/etc/sssd', mode => '0600', }
  configfile { 'sshd_config': dest => '/etc/ssh', }
  configfile { 'lightdm-xsession.desktop': dest => '/usr/share/xsessions', }
  configfile { 'eth0.nmt': dest => '/etc/network/interfaces.d', }
  configfile { 'eth1.nmt': dest => '/etc/network/interfaces.d', }
  configfile { 'xinit-compat.desktop': dest => '/usr/share/xsessions', }
  configfile { 'modules': dest => '/etc/initramfs-tools', }
  configfile { 'plymouthd.conf': dest => '/etc/plymouth', }
  configfile { 'dhclient.conf': dest => '/etc/dhcp', }
  configfile { 'ldmagain.service': dest => '/etc/systemd/system', require => Configscript['ldmagain'], }
  configfile { 'lightdm-greeter': dest => '/etc/pam.d', }
  configfile { 'users.conf': dest => '/etc/lightdm', }

  ln { '/usr/local/bin/pine': target => '/usr/bin/alpine', }
  ln { '/usr/local/bin/perl': target => '/usr/bin/perl', }
  ln { '/usr/local/bin/python': target => '/usr/bin/python', }
  ln { '/boot/boot': target => '/boot', require => Configdir['boot'], }
  #ln { '/usr/bin/sqlplus': target => '/usr/lib/oracle/12.1/client64/bin/sqlplus', }
  ln { '/usr/bin/sl': target => '/usr/games/sl', }

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
  configscript { 'PostLogout': dest => '/etc/lightdm/scripts', }
  configscript { 'sfdisk2parted': dest => '/usr/local/bin', }
  configscript { 'killpower': dest => '/etc/apcupsd', }
  configscript { 'reseed': dest => '/usr/local/bin', }
  configscript { 'remreboot': dest => '/usr/local/bin', }
  configscript { 'xorg_user': dest => '/usr/local/bin', }
  configscript { 'grub2': dest => '/usr/local/bin', }
  configscript { 'fail2log': dest => '/etc/cron.daily', }
  configscript { 'smartdnotify': dest => '/usr/local/libexec', }
  configscript { 'xinit-compat': dest => '/usr/local/libexec', }
  configscript { 'ldmagain': dest => '/usr/local/bin', }
  configscript { 'remote_reapply': dest => '/usr/local/libexec', }
  configscript { 'rrapp': dest => '/usr/local/bin', }

  service { 'cups': ensure => 'running', enable => 'true', require => Configfile['client.conf'], }
  service { 'puppet': ensure => 'running', enable => 'true', require => Exec['enablesplay'], }
  service { 'sssd': ensure => 'running', enable => 'true', require => Configfile['sssd.conf'], }
  service { 'clamav-freshclam': ensure => 'stopped', enable => 'false', }
  service { 'spamassassin': ensure => 'stopped', enable => 'false', }
  service { 'ModemManager': ensure => 'stopped', enable => 'false', }
  service { 'NetworkManager': ensure => 'stopped', enable => 'false', require => Configfile['eth0.nmt'], }
  service { 'transmission-daemon': enable => 'false', }
  service { 'openvpn': ensure => 'stopped', enable => 'false', }
  service { 'pppd-dns': ensure => 'stopped', enable => 'false', }
  if $::chroot {
    warning('Skipping ldmagain because we are chrooted.')
  }
  else {
    service { 'ldmagain': enable => 'true', require => Configfile['ldmagain.service'], }
  }

  k5login { '/root/.k5login':
    ensure     => 'present',
    principals => [
      'jluster@NMT.EDU',
      'ken@NMT.EDU',
      'dgraham@NMT.EDU',
      'dylan@NMT.EDU',
    ]
  }

  exec { 'plymouth-update':
    command     => '/usr/sbin/update-initramfs -u',
    subscribe   => [ Configfile['modules'], Configfile['plymouthd.conf'], ],
    refreshonly => true,
  }

  exec { 'enablesplay':
    provider => shell,
    command  => 'printf "splay=true\n" >> /etc/puppet/puppet.conf',
    unless   => 'grep splay /etc/puppet/puppet.conf',
  }

}
