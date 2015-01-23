class profiles::nmt::rsync::f21::comsol {

  exec { 'comsol43b':
    command => 'rm -rf /usr/local/comsol43b',
    onlyif => 'test -e /usr/local/comsol43b',
  }

  rsync::get { 'comsol':
    source => 'update.nmt.edu::F21-comsol/comsol44',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'comsol-desktop':
    source => 'update.nmt.edu::F21-comsol/comsol.desktop',
    path => '/usr/local/share/applications/',
    times => true,
  }

  rsync::get { 'comsolsh':
    source => 'update.nmt.edu::F21-comsol/comsol',
    path => '/usr/local/bin/',
    times => true,
  }

}
