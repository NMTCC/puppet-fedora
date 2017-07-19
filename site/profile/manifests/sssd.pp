# Configure sssd
class profile::sssd {

  class { '::sssd':
    config => {
      'domain/nmt' => {
        'auth_provider'                  => 'krb5',
        'autofs_provider'                => 'ldap',
        'cache_credentials'              => true,
        'chpass_provider'                => 'krb5',
        'id_provider'                    => 'ldap',
        'krb5_kpasswd'                   => 'kerberos-1.nmt.edu',
        'krb5_realm'                     => 'NMT.EDU',
        'krb5_server'                    =>
          ['kerberos-1.nmt.edu', 'kerberos-2.nmt.edu'],
        'krb5_store_password_if_offline' => true,
        'ldap_id_use_start_tls'          => true,
        'ldap_search_base'               => 'dc=tcc,dc=nmt,dc=edu',
        'ldap_tls_cacertdir'             => '/etc/ssl/certs',
        'ldap_uri'                       => 'ldap://ldap0.nmt.edu/',
      },
      'sssd'       => {
        'services'            => ['nss', 'pam', 'autofs'],
        'config_file_version' => '2',
        'domains'             => 'nmt',
      },
      'nss'        => {},
      'pam'        => {},
      'autofs'     => {},
    }
  }

  class { 'nsswitch':
    passwd    => ['compat', 'sss'],
    group     => ['compat', 'sss'],
    shadow    => ['compat', 'sss'],
    gshadow   => 'files',
    hosts     =>
      ['files', 'myhostname', 'mdns4_minimal', '[NOTFOUND=return]', 'dns'],
    networks  => 'files',
    protocols => ['db', 'files'],
    services  => ['db', 'files', 'sss'],
    ethers    => ['db', 'files'],
    rpc       => ['db', 'files'],
    netgroup  => ['nis', 'sss'],
    sudoers   => 'files',
  }

}
