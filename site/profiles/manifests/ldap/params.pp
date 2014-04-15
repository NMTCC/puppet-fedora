# class profiles::ldap::params

class profiles::ldap::params {

  $prefix     = '/etc/openldap'
  $config     = 'ldap.conf'
  $cacertdir  = '/etc/openldap/cacerts'

  $owner      = 'root'
  $group      = 'root'

  $ssl_prefix = '/etc/openldap/cacerts'
}
