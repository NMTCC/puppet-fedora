# class profiles::tcc::ldap

class profiles::tcc::ldap {

  class { '::profiles::ldap':
    uri      => 'ldap://ldap0.nmt.edu/ ldap://ldap1.nmt.edu/',
    base     => 'dc=tcc,dc=nmt,dc=edu',
    ssl      => 'true',
    ssl_cert => 'tccCA.pem',
  }

}
