# Debian workstation
class role::stretch {

  include profile::apt
  include profile::automount
  include profile::base
  include profile::ldap
  include profile::kerberos
  include profile::sshd
  include profile::sssd
  include profile::sudo

}
