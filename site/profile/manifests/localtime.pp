# Configure hwclock
class profile::localtime {

  exec { 'adjtime':
    path    => '/bin:/usr/bin:/sbin:/usr/sbin',
    command => 'hwclock --systohc --localtime',
    unless  => 'test -e /etc/adjtime',
  }

  exec { 'localtime':
    path    => '/bin:/usr/bin:/sbin:/usr/sbin',
    command => 'hwclock --systohc --localtime',
    onlyif  => 'grep UTC /etc/adjtime',
    require => Exec['adjtime'],
  }

}
