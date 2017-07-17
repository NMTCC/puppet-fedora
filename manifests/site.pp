File { backup => false, }

node default {

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
