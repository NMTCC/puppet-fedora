# Configure LDAP
class profile::ldap {

  file { '/usr/share/ca-certificates/nmt':
    ensure => directory,
    owner  => 'root',
    group  => 'root',
    mode   => '0755',
  }

  file { '/usr/share/ca-certificates/nmt/itcCA.pem':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => 'http://duplicon.nmt.edu/itcCA.pem',
    require => File['/usr/share/ca-certificates/nmt'],
  }

  file { '/etc/ssl/certs/itcCA.pem':
    ensure => link,
    target => '/usr/share/ca-certificates/nmt/itcCA.pem',
  }

  exec { 'cahashlink':
    command     => 'c_rehash /etc/ssl/certs',
    require     => File['/etc/ssl/certs/itcCA.pem'],
    subscribe   => File['/usr/share/ca-certificates/nmt/itcCA.pem'],
    refreshonly => true,
  }

  class { 'openldap::client':
    base          => 'dc=tcc,dc=nmt,dc=edu',
    uri           => ['ldap://ldap0.nmt.edu/', 'ldap://ldap1.nmt.edu/'],
    ssl           => 'start_tls',
    tls_cacertdir => '/etc/ssl/certs',
    tls_cacert    => '/etc/ssl/certs/itcCA.pem',
    require       => File['/etc/ssl/certs/itcCA.pem'],
  }

}
