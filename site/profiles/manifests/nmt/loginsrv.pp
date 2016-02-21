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
        content => "[DEFAULT]\nbantime = 86400\nbanaction = firewallcmd-ipset\nbackend = systemd\nsender = fail2ban@rainbow.nmt.edu\ndestemail = tcc-fail2ban@nmt.edu\nignoreip = 127.0.0.1/8 129.138.0.0/16\nmaxretry = 10\naction = %(action_mwl)s\nusedns = no\n\n[sshd]\nenabled = true\n",
        require => Package['fail2ban'],
      }

      service { 'fail2ban':
        ensure    => 'running',
        enable    => 'true',
        subscribe => File['/etc/fail2ban/jail.d/local.conf'],
      }

      exec { 'pam_tally2':
        path    => '/bin/',
        unless  => 'grep pam_tally2.so /etc/pam.d/sshd',
        command => 'sed -i -e "2iauth       required     pam_tally2.so" /etc/pam.d/sshd',
      }

    }

    default: { $dummy = [ 'Not a login server.', ] }

  }

}
