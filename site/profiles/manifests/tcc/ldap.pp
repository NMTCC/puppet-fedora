# class profiles::tcc::ldap

class profiles::tcc::ldap(
  $uri            = "ldap://ldap0.nmt.edu/ ldap://ldap1.nmt.edu/", 
  $base           = "dc=tcc,dc=nmt,dc=edu",
  $ssl            = "true",
  $ssl_cert       = "tccCA.pem",
  $ensure         = present) {

  include profiles::tcc::ldap::params

  package { $profiles::tcc::ldap::params::package:
    ensure => $ensure,
  }

  File {
    ensure  => $ensure,
    mode    => 0644,
    owner   => $profiles::tcc::ldap::params::owner,
    group   => $profiles::tcc::ldap::params::group,
  }

  file { "${profiles::tcc::ldap::params::prefix}":
    ensure  => $ensure ? {
                  present => directory,
                  default => absent,
                },
    require => Package[$profiles::tcc::ldap::params::package],
  }

  file { "${profiles::tcc::ldap::params::prefix}/${tcc::ldap::params::config}":
    content => template("profiles/${profiles::tcc::ldap::params::config}.erb"),
    require => File[$profiles::tcc::ldap::params::prefix],
  }
    
  if($ssl == "true") {
   
    if(!$ssl_cert) {
      fail("When ssl is enabled you must define ssl_cert_loc (filename)")
    }
      
    file { "${profiles::tcc::ldap::params::cacertdir}/${ssl_cert}":
      source => "puppet:///modules/profiles/ldap/${ssl_cert}"
    }
  }
}
