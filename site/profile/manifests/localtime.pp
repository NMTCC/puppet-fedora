# Configure hwclock
class profile::localtime {

  exec { 'adjtime':
    command => 'hwclock --systohc --localtime',
    unless  => 'test -e /etc/adjtime',
  }

  exec { 'localtime':
    command => 'hwclock --systohc --localtime',
    onlyif  => 'grep UTC /etc/adjtime',
    require => Exec['adjtime'],
  }

}
