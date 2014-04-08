class profiles::tcc::ldap::params {

      $package   = [ 'openldap', 'openldap-clients' ]
            
      $prefix    = '/etc/openldap'
      $config    = 'ldap.conf'
      $cacertdir = '/etc/openldap/cacerts'

      $owner     = 'root'
      $group     = 'root'

      $ssl_prefix    = '/etc/openldap/cacerts'
}
