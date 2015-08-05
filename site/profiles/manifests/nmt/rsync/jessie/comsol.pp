class profiles::nmt::rsync::jessie::comsol {

  exec { 'comsol44':
    path => '/usr/bin/',
    command => 'rm -rf /usr/local/comsol44',
    onlyif => 'test -e /usr/local/comsol44',
  }

  rsync::get { 'comsol':
    source => 'duplicon.nmt.edu::Jessie-comsol/comsol51',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'comsol-desktop':
    source => 'duplicon.nmt.edu::Jessie-comsol/comsol.desktop',
    path => '/usr/local/share/applications/',
    times => true,
  }

  rsync::get { 'comsolsh':
    source => 'duplicon.nmt.edu::Jessie-comsol/comsol',
    path => '/usr/local/bin/',
    times => true,
  }

}
