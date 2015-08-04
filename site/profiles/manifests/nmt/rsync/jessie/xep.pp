class profiles::nmt::rsync::jessie::xep {

  rsync::get { 'xep':
    source => 'duplicon.nmt.edu::Jessie-xep/xep-4.2',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'xep-sh':
    source => 'duplicon.nmt.edu::Jessie-xep/xep.sh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['xep'],
  }

  rsync::get { 'xep-csh':
    source => 'duplicon.nmt.edu::Jessie-xep/xep.csh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['xep'],
  }

}
