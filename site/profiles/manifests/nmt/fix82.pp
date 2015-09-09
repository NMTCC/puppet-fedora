# class profiles::nmt::fix82

class profiles::nmt::fix82 {

  exec { 'fix82':
    provider => shell,
    command  => 'dpkg --configure -a',
  }

  exec { 'fixcron':
    provider => shell,
    command  => 'apt-get -y install --reinstall cron',
    unless   => 'exit $(dpkg -s cron | grep reinstreq | wc -l)',
    require  => Exec['fix82'],
  }

}
