# Debian workstation
class role::stretch {

  include profile::apt
  include profile::automount
  include profile::base
  include profile::firewall
  include profile::ldap
  include profile::lightdm
  include profile::kerberos
  include profile::packages
  include profile::sshd
  include profile::sssd
  include profile::sudo

  Class[profile::apt] -> Class[profile::packages]

}
