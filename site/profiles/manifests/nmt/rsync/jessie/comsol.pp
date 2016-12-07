class profiles::nmt::rsync::jessie::comsol {

  exec { 'comsol51':
    path => '/bin:/usr/bin/',
    command => 'rm -rf /usr/local/comsol51',
    onlyif => 'test -e /usr/local/comsol51',
  }

  rsync::get { 'comsol':
    source => 'duplicon.nmt.edu::Jessie-comsol/comsol52a',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'comsol-desktop':
    source => 'duplicon.nmt.edu::Jessie-comsol/comsol52a.desktop',
    path => '/usr/local/share/applications/comsol.desktop',
    times => true,
    require => Rsync::Get['comsol'],
  }

  rsync::get { 'comsolsh':
    source  => 'duplicon.nmt.edu::Jessie-comsol/comsol52a.sh',
    path    => '/usr/local/bin/comsol',
    times   => true,
    require => Rsync::Get['comsol'],
  }

}
