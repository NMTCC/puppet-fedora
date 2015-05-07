# class roles::debian

class roles::debian {

  include profiles::nmt
  include profiles::nmt::apt
  include profiles::nmt::autofs
  include profiles::nmt::config
  include profiles::nmt::ldap
  include profiles::nmt::localizations
  include profiles::nmt::packages
  include profiles::nmt::passwd
  include profiles::nmt::postfix
  include profiles::nmt::remctl
  include profiles::nmt::rsync

  Class[profiles::nmt::apt] -> Class[profiles::nmt::packages] -> Class[profiles::nmt::localizations]

  # this because we run before d-i cleans up
  Package { allowcdrom => true, }

}
