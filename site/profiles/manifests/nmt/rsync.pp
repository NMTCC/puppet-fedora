# class profiles::nmt::rsync

class profiles::nmt::rsync {

  case $::operatingsystemmajrelease {
    '19': {
      include profiles::nmt::rsync::f19::extlinux
      include profiles::nmt::rsync::f19::logo
    }
    '21': {
      include profiles::nmt::rsync::f19::anaconda
      include profiles::nmt::rsync::f19::comsol
      include profiles::nmt::rsync::f21::extlinux
      include profiles::nmt::rsync::f19::logo
      include profiles::nmt::rsync::f19::maple
      include profiles::nmt::rsync::f19::matlab
      include profiles::nmt::rsync::f19::vmd
    }
    default: {}
  }

}
