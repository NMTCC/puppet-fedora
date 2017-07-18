# Debian workstation
class role::stretch {

  include profile::automount
  include profile::base
  include profile::sudo

}
