class profiles::nmt::rsync::f21::comsol {

  file { 'comsol43b':
    ensure => 'absent',
    path => '/usr/local/comsol43b',
    recurse => true,
    purge => true,
    force => true,
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
