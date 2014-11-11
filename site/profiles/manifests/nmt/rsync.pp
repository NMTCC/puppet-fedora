# class profiles::nmt::rsync

class profiles::nmt::rsync {
  include profiles::nmt::rsync::anaconda
  include profiles::nmt::rsync::comsol
  include profiles::nmt::rsync::extlinux
  include profiles::nmt::rsync::logo
  include profiles::nmt::rsync::maple
  include profiles::nmt::rsync::matlab
  include profiles::nmt::rsync::vmd
}
