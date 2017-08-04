# rsync Oracle Instant Client
class profile::rsync::oracle {

  rsync::get { 'instantclient':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-oracle/instantclient_12_2",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'oracle-sqlplus-sh':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-oracle/oracle-sqlplus.sh",
    path    => '/etc/profile.d/',
    times   => true,
    require => Rsync::Get['instantclient'],
  }

  rsync::get { 'oracle-sqlplus-csh':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-oracle/oracle-sqlplus.csh",
    path    => '/etc/csh/login.d/',
    times   => true,
    require => Rsync::Get['instantclient'],
  }

  file { '/usr/local/bin/ott':
    ensure  => link,
    target  => '/usr/local/instantclient_12_2/sdk/ott',
    require => Rsync::Get['instantclient'],
  }

  file { '/usr/local/bin/proc':
    ensure  => link,
    target  => '/usr/local/instantclient_12_2/sdk/proc',
    require => Rsync::Get['instantclient'],
  }

  file { '/usr/local/bin/procob':
    ensure  => link,
    target  => '/usr/local/instantclient_12_2/sdk/procob',
    require => Rsync::Get['instantclient'],
  }

  file { '/usr/local/bin/rtsora':
    ensure  => link,
    target  => '/usr/local/instantclient_12_2/sdk/rtsora',
    require => Rsync::Get['instantclient'],
  }

  file { '/usr/local/bin/sqlplus':
    ensure  => link,
    target  => '/usr/local/instantclient_12_2/sqlplus',
    require => Rsync::Get['instantclient'],
  }

}
