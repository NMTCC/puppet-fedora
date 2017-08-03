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
      include profile::rsync::phono3py
    }
    default: {
      warning('No rsync paths for this distribution')
    }
  }

}
