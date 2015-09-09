# class profiles::nmt

class profiles::nmt {

  # This is a hack to make nodes report as unchanged;
  # they report as changed whenever an exec is actually run.
  exec { 'kinit': command => '/usr/bin/kinit -k', unless => '/usr/bin/klist -k; case $? in 0) exit 0;; *) /usr/bin/kinit -k;; esac', }

  case $::operatingsystem {
    'Fedora': {

      # This has the same hack, plus, the arrow at the end of this line makes
      #'yum-makecache' run before 'yum-upgrade'; puppet is orderless otherwise.
      exec { 'yum-makecache': command => '/bin/yum makecache', timeout => 0, unless => '/bin/yum makecache', } ->
      exec { 'yum-update': command => '/bin/yum update -y --setopt=protected_multilib=false', timeout => 0, unless => '/bin/yum check-update', }

      class { '::sudo': } sudo::conf { 'ucsh' : content => '%tcc ALL = (root) NOPASSWD: /usr/bin/du, /usr/bin/file, /usr/bin/ls, /usr/bin/nice, /usr/bin/renice, /usr/bin/ps, /usr/bin/mount, /usr/bin/umount, /usr/bin/kill, /usr/bin/killall, /usr/bin/wall, /usr/bin/eject, /usr/bin/chgrp, /usr/sbin/halt, /usr/sbin/poweroff, /usr/sbin/reboot, /usr/sbin/shutdown, /usr/bin/dracut, /usr/local/bin/reapply', }

      class { '::selinux': mode => 'disabled', }

    }
    'Debian': {

      exec { 'apt-update': command => '/usr/bin/apt-get -y update', timeout => 0, unless => '/usr/bin/apt-get -y update', } ->
      exec { 'apt-upgrade': provider => 'shell', environment => ["DEBIAN_FRONTEND=noninteractive"], command => '/usr/bin/apt-get -y dist-upgrade', timeout => 0, unless => 'exit $(aptitude search "~U" | wc -l)', }

      class { '::sudo': } sudo::conf { 'ucsh' : content => '%tape ALL = (root) NOPASSWD: /usr/bin/du, /usr/bin/file, /bin/ls, /usr/bin/nice, /usr/bin/renice, /bin/ps, /bin/mount, /bin/umount, /bin/kill, /usr/bin/killall, /usr/bin/wall, /usr/bin/eject, /bin/chgrp, /bin/systemctl, /usr/local/bin/reapply', }

      exec { 'disable sss sudo':
        path    => '/bin:/usr/bin',
        command => 'sed -i "s/sudoers.*/sudoers:        files/" /etc/nsswitch.conf',
        onlyif  => 'grep "sudoers.*sss" /etc/nsswitch.conf',
      }

    }
  }

}
