# Debian workstation
class role::stretch {

  include profile::apt
  include profile::automount
  include profile::base
  include profile::cron
  include profile::cups
  include profile::grub
  include profile::ldap
  include profile::lightdm
  include profile::localtime
  include profile::mail
  include profile::kerberos
  include profile::packages
  include profile::plymouth
  include profile::postfix
  include profile::puppet
  include profile::rssh
  include profile::rsync
  include profile::scripts
  include profile::services
  include profile::sshd
  include profile::sssd
  include profile::sudo
  include profile::transmission
  include profile::winpart

  unless $::chroot {
    include profile::firewall
    include profile::deployment
    include profile::remctl
    if $::virtual == 'physical' {
      include profile::smartd
    }
  }

  Class[profile::apt] -> Class[profile::packages]

}
