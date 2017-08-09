# Debian login server
class role::loginserver {

  unless $::chroot {
    include profile::fail2ban
  }

}
