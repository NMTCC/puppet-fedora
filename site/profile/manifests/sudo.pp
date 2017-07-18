# Configure sudo
class profile::sudo {

  class { '::sudo': }

  sudo::conf { 'ucsh':
    content => '%tape ALL = (root) NOPASSWD: /usr/bin/du, /usr/bin/file, /bin/ls, /usr/bin/nice, /usr/bin/renice, /bin/ps, /bin/mount, /bin/umount, /bin/kill, /usr/bin/killall, /usr/bin/wall, /usr/bin/eject, /bin/chgrp, /bin/systemctl, /usr/local/bin/reapply, /usr/local/bin/reseed',
  }

}
