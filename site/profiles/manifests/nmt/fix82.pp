# class profiles::nmt::fix82

class profiles::nmt::fix82 {

  exec { 'fix82':
    provider => shell,
    command  => 'dpkg --configure -a; true',
    onlyif   => '[ $(dpkg-query -W -f="\${db:Status-Abbrev}\n" | grep -e "[[:upper:]]" | wc -l) -gt 1 ]',
  }

  exec { 'fixcron':
    provider => shell,
    command  => 'apt-get -y install --reinstall cron',
    unless   => 'exit $(dpkg -s cron | grep reinstreq | wc -l)',
    require  => Exec['fix82'],
  }

}
