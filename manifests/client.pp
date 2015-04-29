node linux {

  case $::operatingsystem {
    'Fedora': {
      include roles::fedora
    }
    'Debian': {
      include roles::debian
    }
    default: {
      warning('No role for this distribution.')
    }
  }

}

node default inherits linux { }
