node fedora {

  include roles::nmt

}

node default inherits fedora { }
