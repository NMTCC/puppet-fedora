class profiles::nmt::localizations {

  case $operatingsystemmajrelease {
  '19': {
      class { "profiles::nmt::localizations::f19": }
    }
  '21': {
      class { "profiles::nmt::localizations::f21": }
    }
  default: {}
  }

}
