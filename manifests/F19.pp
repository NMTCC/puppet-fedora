node fedora19 {

  include roles::tcc
  include roles::sensu

}

node default inherits fedora19 { }
