# class roles::tcc

class roles::tcc {

  include profiles::tcc
  include profiles::tcc::autofs
  include profiles::tcc::config
  include profiles::tcc::yum
  include profiles::tcc::yum::packages
  include profiles::tcc::yum::localizations
  include profiles::tcc::ldap
  include profiles::tcc::passwd
  include profiles::tcc::remctl

  include profiles::iris

  Class[profiles::tcc::yum] -> Class[profiles::tcc::yum::packages] -> Class[profiles::tcc::yum::localizations]

}
