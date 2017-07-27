# Configure kerberos
class profile::kerberos {

  # kerberos conf
  class { 'mit_krb5':
    default_ccache_name => 'KEYRING:persistent:%{uid}',
    default_realm       => 'NMT.EDU',
    dns_lookup_realm    => true,
    dns_lookup_kdc      => true,
    forwardable         => true,
    rdns                => false,
    renew_lifetime      => '7d',
    ticket_lifetime     => '24h',
  }

  class { 'mit_krb5::logging':
    admin_server => 'FILE:/var/log/kadmind.log',
    default      => 'FILE:/var/log/krb5libs.log',
    kdc          => 'FILE:/var/log/krb5kdc.log',
  }

  mit_krb5::realm { 'NMT.EDU':
    admin_server => 'kerberos-1.nmt.edu:749',
    kdc          => ['kerberos-1.nmt.edu', 'kerberos-2.nmt.edu'],
  }

  mit_krb5::domain_realm { 'NMT.EDU':
    domains => ['nmt.edu', '.nmt.edu'],
  }

  # root user k5login
  k5login { '/root/.k5login':
    ensure     => present,
    principals => [
      'dgraham@NMT.EDU',
      'jluster@NMT.EDU',
      'ken@NMT.EDU',
      'travis@NMT.EDU',
    ]
  }

}
