# class profiles::nmt::rsync

class profiles::nmt::rsync {

  case $::operatingsystemrelease {
    '19': {
      include profiles::nmt::rsync::f19::extlinux
      include profiles::nmt::rsync::f19::logo
      include profiles::nmt::rsync::f19::f21ks
    }
    '21': {
#      include profiles::nmt::rsync::f19::anaconda
#      include profiles::nmt::rsync::f21::comsol
      include profiles::nmt::rsync::f21::extlinux
      include profiles::nmt::rsync::f21::isolinux
#      include profiles::nmt::rsync::f19::logo
#      include profiles::nmt::rsync::f19::maple
#      include profiles::nmt::rsync::f19::matlab
#      include profiles::nmt::rsync::f19::vmd
    }
    default: {
      warning('No rsync paths for this release version.')
    }
  }

}
