# Configure CUPS
class profile::cups {

  file { '/etc/cups/client.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "ServerName paperhost.nmt.edu\n",
  }

  service { 'cups':
    ensure  => running,
    enable  => true,
    require => File['/etc/cups/client.conf'],
  }

}
