# class profiles::nrao
#
# Defines resources needed for NRAO SIW Conference

class profiles::nrao {

  file { '/var/nrao':
    ensure => 'directory',
    owner  => 'demo1',
    mode   => '0777',
  }


}
