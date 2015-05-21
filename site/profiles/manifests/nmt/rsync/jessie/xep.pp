class profiles::nmt::rsync::jessie::xep {

  rsync::get { 'xep':
    source => 'update.nmt.edu::Jessie-xep/xep-4.2',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'xep-sh':
    source => 'update.nmt.edu::Jessie-xep/xep.sh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['xep'],
  }

  rsync::get { 'xep-csh':
    source => 'update.nmt.edu::Jessie-xep/xep.csh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['xep'],
  }

}
