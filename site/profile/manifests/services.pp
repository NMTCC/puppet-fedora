# Configure other services
class profile::services {

  service { 'clamav-freshclam':
    ensure => stopped,
    enable => false,
  }

  service { 'minissdpd':
    ensure => stopped,
    enable => false,
  }

  service { 'ModemManager':
    ensure => stopped,
    enable => false,
  }

  service { 'pppd-dns':
    ensure => stopped,
    enable => false,
  }

  service { 'rsync':
    ensure => stopped,
    enable => false,
  }

  service { 'spamassassin':
    ensure => stopped,
    enable => false,
  }

  unless $::chroot {

    service { 'cron':
      ensure  => running,
      enable  => true,
      require => Package['cron'],
    }

    service { 'NetworkManager':
      ensure => running,
      enable => true,
    }

  }

}
