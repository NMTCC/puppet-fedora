# class profiles::nmt::rsync

class profiles::nmt::rsync {

  case $::operatingsystemmajrelease {
    '19': {
      include profiles::nmt::rsync::f19::extlinux
      include profiles::nmt::rsync::f19::logo
      include profiles::nmt::rsync::f19::f21ks
    }
    '21': {
      include profiles::nmt::rsync::f19::anaconda
      include profiles::nmt::rsync::f21::comsol
      include profiles::nmt::rsync::f21::extlinux
      include profiles::nmt::rsync::f21::iris
      include profiles::nmt::rsync::f21::isolinux
      include profiles::nmt::rsync::f19::logo
      include profiles::nmt::rsync::f21::maple
      include profiles::nmt::rsync::f21::matlab
      include profiles::nmt::rsync::f19::vmd
    }
    '8': {
      include profiles::nmt::rsync::f19::anaconda
      include profiles::nmt::rsync::jessie::comsol
      include profiles::nmt::rsync::jessie::extlinux
      include profiles::nmt::rsync::f19::logo
      include profiles::nmt::rsync::jessie::maple
      include profiles::nmt::rsync::jessie::matlab
      include profiles::nmt::rsync::f19::vmd
      include profiles::nmt::rsync::jessie::mozilla
      include profiles::nmt::rsync::jessie::xep
      include profiles::nmt::rsync::jessie::oracle
    }
    default: {
      warning('No rsync paths for this release version.')
    }
  }

}
