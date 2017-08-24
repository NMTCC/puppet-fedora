# Debian login server
class role::loginserver {

  include profile::runlevel

  unless $::chroot {
    include profile::fail2ban
    include profile::nrpe
  }

}
