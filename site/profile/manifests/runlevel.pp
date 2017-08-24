# Configure run level
class profile::runlevel {

  exec { 'multi-user.target':
    provider => shell,
    command  => 'cd /lib/systemd/system && ln -sf multi-user.target default.target',
    onlyif   => 'readlink /lib/systemd/system/default.target | grep graphical',
  }

}
