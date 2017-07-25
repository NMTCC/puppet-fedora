Exec { path => '/bin:/usr/bin:/sbin:/usr/sbin', }
File { backup => false, }

node default {

  case $::puppetversion {
    '3.7.2': {
      include role::jessie
    }
    '4.8.2': {
      include role::stretch
    }
    default: {
      warning('No role for this Puppet Agent version.')
    }
  }

}
