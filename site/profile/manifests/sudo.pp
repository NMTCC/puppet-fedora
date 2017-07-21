# Configure sudo
class profile::sudo {

  class { '::sudo': }

  $disks = '/bin/mount, /bin/umount, /usr/bin/eject'
  $files = '/bin/ls, /bin/chgrp, /usr/bin/file, /usr/bin/du'
  $procs = '/bin/ps, /bin/kill, /usr/bin/nice, /usr/bin/renice, /usr/bin/killall'
  $other = '/bin/systemctl, /usr/bin/wall'
  $deploy = '/usr/local/bin/reapply, /usr/local/bin/reseed'

  sudo::conf { 'ucsh':
    content => "%tape ALL = (root) NOPASSWD: ${disks}, ${files}, ${procs}, ${other}, ${deploy}",
  }

}
