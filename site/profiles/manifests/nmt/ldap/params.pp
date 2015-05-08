class profiles::nmt::ldap::params {

  case $::operatingsystem {
    'Fedora': {
      $package   = [ 'openldap' ]
      $confdir   = 'openldap'
    }
    'Debian': {
      $package   = [ 'libldap-2.4-2' ]
      $confdir   = 'ldap'
    }
  }

  $prefix        = "/etc/${confdir}"
  $config        = 'ldap.conf'
  $cacertdir     = "/etc/${confdir}/cacerts"
  $cacertpath    = "/etc/${confdir}/cacerts/itcCA.pem"

  $owner         = 'root'
  $group         = 'root'

  $ssl_prefix    = "/etc/${confdir}/cacerts"

}
