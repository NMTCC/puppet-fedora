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

  exec { 'Fall2016-1':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /var/lib/transmission-daemon/downloads/Fall2016-master.1',
    onlyif  => 'test -e /var/lib/transmission-daemon/downloads/Fall2016-master.1',
  }

  exec { 'Fall2016-2':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /var/lib/transmission-daemon/downloads/Fall2016-master.2',
    onlyif  => 'test -e /var/lib/transmission-daemon/downloads/Fall2016-master.2',
  }

  if $::blockdevice_sda_size {

    if ($::template == 'dual-boot') and ($::blockdevice_sda_size > 500107862016) {

      exec { 'reseed':
        provider => shell,
        command  => '/usr/local/bin/reseed',
        unless   => 'pgrep transmission',
        require  => File['reseed'],
      }

      exec { 'reallytorrent':
        provider => shell,
        path     => '/bin:/usr/bin',
        command  => 'transmission-remote -a http://duplicon.nmt.edu/Spring2017-master.1.torrent; sleep 2; transmission-remote -t c51a49547a5122c8f73c322b63fdf4c851f2ff05 -U -D -SR -Bh -o -e 500 --no-utp; sleep 2',
        onlyif   => 'pgrep transmission',
      }

    }

  }

}
