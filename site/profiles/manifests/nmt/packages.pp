# Defines the TCC package lists
class profiles::nmt::packages {

  case $::operatingsystemmajrelease {
    '19': {
      contain profiles::nmt::packages::f19
    }
    '21': {
      contain profiles::nmt::packages::f21
    }
    default: {
      $packlist = []
      $removelist = []
    }
  }

  Package { ensure => 'installed', require => Exec['yum-makecache'], }
  package { $packlist : provider => 'yum', }
  package { $removelist : ensure => 'absent', provider => 'yum', }

}
