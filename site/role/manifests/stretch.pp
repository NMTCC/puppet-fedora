# Debian workstation
class role::stretch {

  include profile::automount
  include profile::base
  include profile::ldap
  include profile::kerberos
  include profile::sshd
  include profile::sudo

}
