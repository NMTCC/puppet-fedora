# class roles::nmt

class roles::nmt {

  include profiles::nmt
  include profiles::nmt::autofs
  include profiles::nmt::config
  include profiles::nmt::yum
  include profiles::nmt::yum::packages
  include profiles::nmt::yum::localizations
  include profiles::nmt::ldap
  include profiles::nmt::passwd
  include profiles::nmt::remctl
  include profiles::nmt::rsync


  Class[profiles::nmt::yum] -> Class[profiles::nmt::yum::packages] -> Class[profiles::nmt::yum::localizations]

}
