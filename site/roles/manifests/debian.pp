# class roles::debian

class roles::debian {

  include profiles::nmt
  include profiles::nmt::apt
  include profiles::nmt::autofs
  include profiles::nmt::config
  include profiles::nmt::ldap
  include profiles::nmt::localtime
  include profiles::nmt::ooffice
  include profiles::nmt::passwd
  include profiles::nmt::postfix
  include profiles::nmt::remctl
  include profiles::nmt::rsync
  include profiles::nmt::firewall
  include profiles::nmt::loginsrv

  case $::chroot {
    'debian-installer': {
      warning('In debian-installer: skipping packages')
      Class[profiles::nmt::apt] -> Class[profiles::nmt]
    }
    default: {
      include profiles::nmt::localizations
      include profiles::nmt::packages
      Class[profiles::nmt::apt] -> Class[profiles::nmt] -> Class[profiles::nmt::packages] -> Class[profiles::nmt::localizations]
    }
  }

  # this because we run before d-i cleans up
  Package { allowcdrom => true, }

}
