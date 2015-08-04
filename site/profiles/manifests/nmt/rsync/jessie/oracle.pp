class profiles::nmt::rsync::jessie::oracle {

  rsync::get { 'instantclient':
    source    => 'duplicon.nmt.edu::Jessie-oracle/instantclient_12_1',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'oracle-sqlplus-sh':
    source  => 'duplicon.nmt.edu::Jessie-oracle/oracle-sqlplus.sh',
    path    => '/etc/profile.d/',
    times   => true,
    require => Rsync::Get['instantclient'],
  }

  rsync::get { 'oracle-sqlplus-csh':
    source  => 'duplicon.nmt.edu::Jessie-oracle/oracle-sqlplus.csh',
    path    => '/etc/profile.d/',
    times   => true,
    require => Rsync::Get['instantclient'],
  }

  file { '/usr/bin/sqlplus':
    ensure => 'link',
    target => '/usr/local/instantclient_12_1/sqlplus',
    require => Rsync::Get['instantclient'],
  }

  file { '/usr/bin/proc':
    ensure => 'link',
    target => '/usr/local/instantclient_12_1/sdk/proc',
    require => Rsync::Get['instantclient'],
  }

  file { '/usr/bin/procob':
    ensure => 'link',
    target => '/usr/local/instantclient_12_1/sdk/procob',
    require => Rsync::Get['instantclient'],
  }

  file { '/usr/bin/rtsora':
    ensure => 'link',
    target => '/usr/local/instantclient_12_1/sdk/rtsora',
    require => Rsync::Get['instantclient'],
  }

}
