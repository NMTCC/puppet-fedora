# Debian workstation
class role::stretch {

  include profile::apt
  include profile::automount
  include profile::base
  include profile::cups
  include profile::fail2ban
  include profile::firewall
  include profile::grub
  include profile::ldap
  include profile::lightdm
  include profile::localtime
  include profile::kerberos
  include profile::packages
  include profile::plymouth
  include profile::puppet
  include profile::scripts
  include profile::services
  include profile::sshd
  include profile::sssd
  include profile::sudo
  include profile::transmission

  Class[profile::apt] -> Class[profile::packages]

}
