# Configure NRPE
class profile::nrpe {

  $disk = "command[check_disk]=/usr/lib/nagios/plugins/check_disk -w 20% -c 10% -p /dev/mapper/vg_${::lsbdistcodename}-lv_root"
  $procs = 'command[check_total_procs]=/usr/lib/nagios/plugins/check_procs -w 500 -c 600'

  package { 'nagios-nrpe-server': }

  file { '/etc/nagios/nrpe.d/nmt.cfg':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "allowed_hosts=tccmon.nmt.edu\n${disk}\n${procs}\n",
    require => Package['nagios-nrpe-server'],
    notify  => Service['nagios-nrpe-server'],
  }

  service { 'nagios-nrpe-server':
    ensure  => running,
    enable  => true,
    require => File['/etc/nagios/nrpe.d/nmt.cfg'],
  }

  firewalld_port { 'Open nrpe port in the public zone':
    ensure   => present,
    zone     => 'public',
    port     => 5666,
    protocol => 'tcp',
  }

}
