# Configure rsync packages
class profile::rsync {

  case $::lsbdistcodename {
    'stretch': {
      include profile::rsync::anaconda
      include profile::rsync::chimera
      include profile::rsync::phono3py
    }
    default: {
      warning('No rsync paths for this distribution')
    }
  }

}
