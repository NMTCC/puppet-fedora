# Configure sshd
class profile::sshd {

  service { 'ssh':
    ensure    => running,
    enable    => true,
    subscribe => [
      Sshd_Config['PermitRootLogin'],
      Sshd_Config['GSSAPIAuthentication'],
    ],
  }

  sshd_config {

    'PermitRootLogin':
      ensure => present,
      value  => 'without-password',;

    'GSSAPIAuthentication':
      ensure => present,
      value  => 'yes',;

  }

}
