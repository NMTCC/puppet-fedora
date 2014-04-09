# class profiles::ldap

class profiles::ldap(
  $uri            = "",
  $base           = "",
  $ssl            = "true",
  $ssl_cert   = ""
                     ) {

  include ::profiles::ldap::params

  file { "${::profiles::ldap::params::prefix}":
    ensure => directory,
    mode => 0644,
    owner => $profiles::tcc::ldap::params::owner,
    group => $profiles::tcc::ldap::params::group,
  } ->

  file { "${::profiles::ldap::params::prefix}/${::profiles::ldap::params::config}":
    content => template("profiles/${::profiles::ldap::params::config}.erb"),
  }

  if str2bool($ssl) {

    if ($ssl_cert == "") {
      fail("When ssl is enabled you must define ssl_cert_loc (filename)")
    }

    file { "${::profiles::ldap::params::cacertdir}/${ssl_cert}":
      source => "puppet:///modules/profiles/ldap/${ssl_cert}"
    }
  }
}
