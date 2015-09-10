# class profiles::nmt::fix82

class profiles::nmt::fix82 {

  file { '/tmp/fix82':
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0750',
    content => "#!/bin/bash\ntrap "" SIGINT SIGTERM\ndpkg --configure -a\nif dpkg -s cron | grep reinstreq > /dev/null\nthen\n    apt-get -y install --reinstall cron\nfi\n",
  }

  exec { 'fix82':
    provider => shell,
    command  => '/sbin/start-stop-daemon -x /tmp/fix82 -b -S',
    require  => File['/tmp/fix82'],
  }

}
