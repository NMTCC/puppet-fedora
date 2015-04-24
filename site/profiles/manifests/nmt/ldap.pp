# class profiles::nmt::ldap

class profiles::nmt::ldap(
  $uri            = "ldap://ldap0.nmt.edu/ ldap://ldap1.nmt.edu/", 
  $base           = "dc=tcc,dc=nmt,dc=edu",
  $ssl            = "true",
  $ssl_cert       = "itcCA.pem",
  $ensure         = present) {

  include profiles::nmt::ldap::params

  package { $profiles::nmt::ldap::params::package:
    ensure => $ensure,
  }

  File {
    ensure  => $ensure,
    mode    => 0644,
    owner   => $profiles::nmt::ldap::params::owner,
    group   => $profiles::nmt::ldap::params::group,
  }

  file { "${profiles::nmt::ldap::params::prefix}":
    ensure  => $ensure ? {
                  present => directory,
                  default => absent,
                },
    require => Package[$profiles::nmt::ldap::params::package],
  }

  file { "${profiles::nmt::ldap::params::prefix}/${nmt::ldap::params::config}":
    content => template("profiles/${profiles::nmt::ldap::params::config}.erb"),
    require => File[$profiles::nmt::ldap::params::prefix],
  }
    
  if($ssl == "true") {
   
    if(!$ssl_cert) {
      fail("When ssl is enabled you must define ssl_cert_loc (filename)")
    }
      
    file { "${profiles::nmt::ldap::params::cacertdir}/${ssl_cert}":
      source => "puppet:///modules/profiles/ldap/${ssl_cert}"
    }

    exec { "ldap-update-cert":
      provider => shell,
      command =>  "certutil -A -n itcCA -t 'TCu,TCu,TCu' -i /etc/${profiles::nmt::ldap::params::confdir}/cacerts/itcCA.pem -d /etc/${profiles::nmt::ldap::params::confdir}/cacerts/",
      onlyif => "certutil -L -d /etc/${profiles::nmt::ldap::params::confdir}/cacerts | grep itcCA; exit $?"
    }
  }
}
