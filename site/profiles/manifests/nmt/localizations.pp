class profiles::nmt::localizations {

  case $::operatingsystemrelease {
  '19': {
      class { "profiles::nmt::localizations::f19": }
    }
  '21': {
      class { "profiles::nmt::localizations::f21": }
    }
  default: {
      warning('No localizations for this release version.')
    }
  }

}
