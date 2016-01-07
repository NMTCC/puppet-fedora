class profiles::nmt::spring2016 {

  if ($::template == 'dual-boot') {

    exec { 'reseed':
      provider => shell,
      command  => '/usr/local/bin/reseed',
      unless   => 'pgrep transmission-daemon',
    }

  }

}
