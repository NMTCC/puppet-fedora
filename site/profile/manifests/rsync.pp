# Configure rsync packages
class profile::rsync {

  case $::lsbdistcodename {
    'stretch': {
      include profile::rsync::anaconda
      include profile::rsync::chimera
      include profile::rsync::comsol
      include profile::rsync::extlinux
      include profile::rsync::maple
      include profile::rsync::matlab
      include profile::rsync::mozilla
      include profile::rsync::oracle
      include profile::rsync::phono3py
      include profile::rsync::taup
      include profile::rsync::vmd
    }
    default: {
      warning('No rsync paths for this distribution')
    }
  }

  exec { 'xdg-desktop-menu':
    command     => 'xdg-desktop-menu forceupdate --mode system',
    refreshonly => true,
  }

  schedule { 'rsync':
    range  => '0 - 23',
    period => daily,
    repeat => 1,
  }

}
