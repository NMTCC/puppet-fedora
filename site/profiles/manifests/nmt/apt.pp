# class profiles::nmt::apt

class profiles::nmt::apt {

  case $::operatingsystemmajrelease {
    '8': {
      class { "profiles::nmt::apt::jessie": }
    }
    default: {
      warning('No repositories for this release version.')
    }
  }

}
