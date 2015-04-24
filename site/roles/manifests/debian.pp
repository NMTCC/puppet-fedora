# class roles::debian

class roles::debian {

  include profiles::nmt
  include profiles::nmt::autofs
  include profiles::nmt::ldap

}
