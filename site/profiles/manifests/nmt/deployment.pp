class profiles::nmt::deployment {

  exec { 'Fall2015':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /var/lib/transmission-daemon/downloads/Fall2015-master.1',
    onlyif  => 'test -e /var/lib/transmission-daemon/downloads/Fall2015-master.1',
  }

  exec { 'Spring2016':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /var/lib/transmission-daemon/downloads/Spring2016-master.1',
    onlyif  => 'test -e /var/lib/transmission-daemon/downloads/Spring2016-master.1',
  }

  if $::blockdevice_sda_size {

    if ($::template == 'dual-boot') and ($::blockdevice_sda_size > 500107862016) {

#      exec { 'reseed':
#        provider => shell,
#        command  => '/usr/local/bin/reseed',
#        unless   => 'pgrep transmission',
#        require  => File['reseed'],
#      }

    }

  }

}
