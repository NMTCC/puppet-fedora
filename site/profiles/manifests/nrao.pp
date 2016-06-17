# class profiles::nrao
#
# Defines resources needed for NRAO SIW Conference

class profiles::nrao {

  case $::hostname {

    'rainbow', 'login': {
      notice("Skipped NRAO conf on login server.")
    }

    default: {
#      file { '/var/nrao':
#        ensure => 'directory',
#        owner  => 'demo1',
#        mode   => '0777',
#      }
      exec { '/var/nrao':
        path    => '/bin:/usr/bin',
        command => 'rm -rf /var/nrao',
        onlyif  => 'test -e /var/nrao',
      }
    }

  }

}
