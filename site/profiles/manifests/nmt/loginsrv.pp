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
        content => "[DEFAULT]\nbantime = 86400\nbanaction = firewallcmd-ipset\nbackend = systemd\nsender = fail2ban@rainbow.nmt.edu\ndestemail = tcc-fail2ban@nmt.edu\nignoreip = 127.0.0.1/8 129.138.0.0/16\nmaxretry = 10\nusedns = no\n\n[sshd]\nenabled = true",
        require => Package['fail2ban'],
      }

    }

    default: { $dummy = [ 'Not a login server.', ] }

  }

}
