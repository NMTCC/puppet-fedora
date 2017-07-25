# Configure fail2ban
class profile::fail2ban {

  package { 'fail2ban': }

  $localjail = '/etc/fail2ban/jail.d/local.conf'
  $localconf = '/etc/fail2ban/fail2ban.d/local.conf'

  file { $localjail:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['fail2ban'],
  }

  file { $localconf:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['fail2ban'],
  }

  ini_setting {

    'f2b-sender':
      ensure  => present,
      path    => $localjail,
      section => 'DEFAULT',
      setting => 'sender',
      value   => 'fail2ban@nmt.edu',
      require => File[$localjail],;

    'f2b-destemail':
      ensure  => present,
      path    => $localjail,
      section => 'DEFAULT',
      setting => 'destemail',
      value   => 'itc-eng@nmt.edu',
      require => File[$localjail],;

    'f2b-ignoreip':
      ensure  => present,
      path    => $localjail,
      section => 'DEFAULT',
      setting => 'ignoreip',
      value   => '127.0.0.1/8 129.138.0.0/16',
      require => File[$localjail],;

    'f2b-action':
      ensure  => present,
      path    => $localjail,
      section => 'DEFAULT',
      setting => 'action',
      value   => '%(action_mwl)s',
      require => File[$localjail],;

    'f2b-usedns':
      ensure  => present,
      path    => $localjail,
      section => 'DEFAULT',
      setting => 'usedns',
      value   => 'no',
      require => File[$localjail],;

    'f2b-sshd-enabled':
      ensure  => present,
      path    => $localjail,
      section => 'sshd',
      setting => 'enabled',
      value   => true,
      require => File[$localjail],;

    'f2b-sshd-backend':
      ensure  => present,
      path    => $localjail,
      section => 'sshd',
      setting => 'backend',
      value   => 'systemd',
      require => File[$localjail],;

    'f2b-sshd-banaction':
      ensure  => present,
      path    => $localjail,
      section => 'sshd',
      setting => 'banaction',
      value   => 'firewallcmd-ipset',
      require => File[$localjail],;

    'f2b-sshd-bantime':
      ensure  => present,
      path    => $localjail,
      section => 'sshd',
      setting => 'bantime',
      value   => '86400',
      require => File[$localjail],;

    'f2b-sshd-maxretry':
      ensure  => present,
      path    => $localjail,
      section => 'sshd',
      setting => 'maxretry',
      value   => '10',
      require => File[$localjail],;

    'f2b-rec-enabled':
      ensure  => present,
      path    => $localjail,
      section => 'recidive',
      setting => 'enabled',
      value   => true,
      require => File[$localjail],;

    'f2b-rec-banaction':
      ensure  => present,
      path    => $localjail,
      section => 'recidive',
      setting => 'banaction',
      value   => 'iptables-allports',
      require => File[$localjail],;

    'f2b-rec-bantime':
      ensure  => present,
      path    => $localjail,
      section => 'recidive',
      setting => 'bantime',
      value   => '2592000',
      require => File[$localjail],;

    'f2b-rec-findtime':
      ensure  => present,
      path    => $localjail,
      section => 'recidive',
      setting => 'findtime',
      value   => '2592000',
      require => File[$localjail],;

    'f2b-rec-maxretry':
      ensure  => present,
      path    => $localjail,
      section => 'recidive',
      setting => 'maxretry',
      value   => '2',
      require => File[$localjail],;

    'f2b-dbpurgeage':
      ensure  => present,
      path    => $localconf,
      section => 'Definition',
      setting => 'dbpurgeage',
      value   => '5270400',
      require => File[$localconf],;

  }

  service { 'fail2ban':
    ensure    => running,
    enable    => true,
    subscribe => [
      Ini_setting['f2b-sender'],
      Ini_setting['f2b-destemail'],
      Ini_setting['f2b-ignoreip'],
      Ini_setting['f2b-action'],
      Ini_setting['f2b-usedns'],
      Ini_setting['f2b-sshd-enabled'],
      Ini_setting['f2b-sshd-backend'],
      Ini_setting['f2b-sshd-banaction'],
      Ini_setting['f2b-sshd-bantime'],
      Ini_setting['f2b-sshd-maxretry'],
      Ini_setting['f2b-rec-enabled'],
      Ini_setting['f2b-rec-banaction'],
      Ini_setting['f2b-rec-bantime'],
      Ini_setting['f2b-rec-findtime'],
      Ini_setting['f2b-rec-maxretry'],
      Ini_setting['f2b-dbpurgeage'],
    ],
  }

}
