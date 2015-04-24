# class roles::debian

class roles::debian {

  include profiles::nmt
  include profiles::nmt::autofs
  include profiles::nmt::config
  include profiles::nmt::ldap
  include profiles::nmt::passwd

}
