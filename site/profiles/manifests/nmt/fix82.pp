# class profiles::nmt::fix82

class profiles::nmt::fix82 {

  exec { 'fix82':
    provider => shell,
    path     => '/bin:/usr/bin',
    command  => 'dpkg --configure -a; apt-get -y install --reinstall cron',
    unless   => 'exit $(dpkg -s cron | grep reinstreq | wc -l)',
  }

}
