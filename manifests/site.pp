File { backup => false, }

node default {

  case $::puppetversion {
    '3.7.2': {
      include role::jessie
    }
    default: {
      include role::stretch
    }
  }

}
