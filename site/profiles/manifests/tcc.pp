# class profiles::tcc

class profiles::tcc {

  # This is a hack to make nodes report as unchanged; they report as changed whenever an exec is actually run.
  profiles::tcc::execnot { 'kinit': command => '/bin/kinit -k', onlyifnot => '/bin/kinit -k', }
  # This has the same hack, plus, the arrow at the end of this line makes 'yum-makecache' run before 'yum-upgrade'; puppet is orderless otherwise.
  profiles::tcc::execnot { 'yum-makecache': command => '/bin/yum makecache', timeout => 0, onlyifnot => '/bin/yum makecache', } ->
  profiles::tcc::execnot { 'yum-update': command => '/bin/yum update -y --setopt=protected_multilib=false', timeout => 0, onlyifnot => '/bin/yum check-update', }
  class { '::sudo': } sudo::conf { 'ucsh' : content => '%tcc ALL = (root) NOPASSWD: /usr/bin/du, /usr/bin/file, /usr/bin/ls, /usr/bin/nice, /usr/bin/renice, /usr/bin/ps, /usr/bin/mount, /usr/bin/umount, /usr/bin/kill, /usr/bin/killall, /usr/bin/wall, /usr/bin/eject, /usr/bin/chgrp, /usr/sbin/halt, /usr/sbin/poweroff, /usr/sbin/reboot, /usr/sbin/shutdown, /usr/local/bin/reapply', }
  class { '::selinux': mode => 'disabled', }
  
}
