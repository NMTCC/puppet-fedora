# class roles::fedora

class roles::fedora {

  include profiles::nmt
  include profiles::nmt::autofs
  include profiles::nmt::config
  include profiles::nmt::yum
  include profiles::nmt::packages
  include profiles::nmt::localizations
  include profiles::nmt::ldap
  include profiles::nmt::passwd
  include profiles::nmt::remctl
  include profiles::nmt::rsync


  Class[profiles::nmt::yum] -> Class[profiles::nmt::packages] -> Class[profiles::nmt::localizations]

}
