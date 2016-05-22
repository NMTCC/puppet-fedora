class profiles::nmt::loginsrv {

  case $::hostname {

    'rainbow', 'login': {

      package { 'fail2ban':
        ensure   => 'installed',
        provider => 'apt',
      }

      file { '/etc/fail2ban/jail.d/local.conf':
        ensure  => 'file',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => "[DEFAULT]\nsender = fail2ban@nmt.edu\ndestemail = itc-eng@nmt.edu\nignoreip = 127.0.0.1/8 129.138.0.0/16\naction = %(action_mwl)s\nusedns = no\n\n[sshd]\nenabled = true\nbackend = systemd\nbanaction = firewallcmd-ipset\nbantime = 86400\nmaxretry = 10\n\n[recidive]\nenabled = true\nbanaction = iptables-allports\nbantime = 604800\nfindtime = 604800\nmaxretry = 2\n",
        require => Package['fail2ban'],
        notify  => Service['fail2ban'],
      }

      file { '/etc/fail2ban/fail2ban.d/local.conf':
        ensure  => 'file',
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => "[Definition]\ndbpurgeage = 1296400\n",
        require => Package['fail2ban'],
        notify  => Service['fail2ban'],
      }

      service { 'fail2ban':
        ensure    => 'running',
        enable    => 'true',
      }

      exec { 'pam_tally2':
        path    => '/bin/',
        unless  => 'grep pam_tally2.so /etc/pam.d/sshd',
        command => 'sed -i -e "2iauth       required     pam_tally2.so" /etc/pam.d/sshd',
      }

    }

    default: { notice("Not a login server.") }

  }

}
