# Configure template deployment
class profile::deployment {

  unless $::chroot {
    include "profile::deployment::${::lsbdistcodename}"
  }

}
