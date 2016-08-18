class profiles::nmt::deployment {

  if $::blockdevice_sda_size {

    if ($::template == 'dual-boot') and ($::blockdevice_sda_size > 500107862016) {

      exec { 'reseed':
        provider => shell,
        command  => '/usr/local/bin/reseed',
        unless   => 'pgrep transmission',
      }

    }

  }

}
