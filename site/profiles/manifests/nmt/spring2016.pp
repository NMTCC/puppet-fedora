class profiles::nmt::spring2016 {

  if ($::template == 'dual-boot') {

    exec { 'removeoldtemplate':
      path => '/bin:/usr/bin/',
      command => 'rm -rf /var/lib/transmission-daemon/downloads/Spring2015-master.1',
      onlyif => 'test -e /var/lib/transmission-daemon/downloads/Spring2015-master.1',
    }

    exec { 'reseed':
      path    => '/bin:/usr/bin',
      command => '/usr/local/bin/reseed',
      unless  => 'pgrep transmission-daemon',
    }

  }

}
