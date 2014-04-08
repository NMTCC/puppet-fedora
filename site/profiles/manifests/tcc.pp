# class profiles::tcc

class profiles::tcc {

  # This is a hack to make nodes report as unchanged; they report as changed whenever an exec is actually run.
  profiles::tcc::execnot { 'kinit': command => '/bin/kinit -k', onlyifnot => '/bin/kinit -k', }
  # This has the same hack, plus, the arrow at the end of this line makes 'yum-makecache' run before 'yum-upgrade'; puppet is orderless otherwise.
  profiles::tcc::execnot { 'yum-makecache': command => '/bin/yum makecache', timeout => 0, onlyifnot => '/bin/yum makecache', } ->
  profiles::tcc::execnot { 'yum-update': command => '/bin/yum update -y --setopt=protected_multilib=false', timeout => 0, onlyifnot => '/bin/yum check-update', }
  class { '::sudo': } sudo::conf { 'ucsh' : content => '%tcc ALL = (root) NOPASSWD: /fs/tcc/bin/add_user_db, /bin/arch, /fs/tcc/bin/create_dir, /usr/bin/du, /usr/bin/file, /bin/hostname, /usr/sbin/lpc, /usr/bin/lprm, /bin/ls, /fs/global/acct/bin/newacct, /bin/nice, /usr/bin/renice, /bin/ps, /usr/bin/quota, /bin/stty, /usr/sbin/tcpdump, /fs/tcc/bin/tmp_clean, /fs/tcc/bin/tmp_purge, /usr/bin/top, /usr/bin/whoami, /bin/mount, /bin/umount, /bin/uname, /usr/bin/kill, /usr/bin/killall, /usr/bin/wall, /fs/tcc/bin/acctmngr, /usr/bin/eject, /bin/chgrp, /usr/bin/halt, /usr/bin/poweroff, /usr/bin/reboot, /u/uc/bin/fix_floppy', }
  class { '::selinux': mode => 'disabled', }
  
}
