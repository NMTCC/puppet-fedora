class profiles::nmt::rsync::jessie::taup {

  rsync::get { 'taup':
    source => 'duplicon.nmt.edu::Jessie-taup/TauP-2.4.0',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'taup-sh':
    source => 'duplicon.nmt.edu::Jessie-taup/taup.sh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['taup'],
  }

  rsync::get { 'taup-csh':
    source => 'duplicon.nmt.edu::Jessie-taup/taup.csh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['taup'],
  }

}
