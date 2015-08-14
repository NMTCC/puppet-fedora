# class profiles::nmt::localtime

class profiles::nmt::localtime {

  exec { 'localtime':
    path    => '/bin:/usr/bin',
    command => 'sed -i "s/UTC/LOCAL/" /etc/adjtime',
    onlyif  => 'grep UTC /etc/adjtime',
  }

}
