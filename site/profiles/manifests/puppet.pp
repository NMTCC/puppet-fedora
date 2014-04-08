# class profiles::puppet

class profiles::puppet {
  
  class { 'puppetdb': listen_address => '0.0.0.0', }
  class { 'puppetdb::master::config': restart_puppet => false, }

  cron { "puppet clean reports":
    command => 'cd /var/lib/puppet/reports && find . -type f -name \*.yaml -mtime +7 -print0 | xargs -0 -n50 /bin/rm -f',
    user => 'root',
    hour => 0,
    minute => 5,
  }
  cron { "puppet optimize dashboard":
    command => 'rake RAILS_ENV=production db:raw:optimize',
    environment => 'HOME=/usr/share/puppet-dashboard/',
    user => 'puppet-dashboard',
    hour => 0,
    minute => 1,
  }
  cron { "puppet clean dashboard database":
    command => 'rake RAILS_ENV=production reports:prune upto=1 unit=wk',
    environment => 'HOME=/usr/share/puppet-dashboard/',
    user => 'puppet-dashboard',
    hour => 0,
    minute => 10,
  }

  
}
