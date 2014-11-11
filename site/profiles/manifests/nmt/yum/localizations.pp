class profiles::nmt::yum::localizations {
  case $operatingsystemmajrelease {
  '19': {
      class { "profiles::nmt::yum::localizations::f19": }
    }
  '21': {
      class { "profiles::nmt::yum::localizations::f21": }
    }
  default: {
    $packlist = []
    $removelist = []
    }
  }
  Package { ensure => 'installed', require => Exec['yum-makecache'], }
  package { $packlist : provider => 'yum', }
  package { $removelist : provider => 'yum', ensure => 'absent', }
}
