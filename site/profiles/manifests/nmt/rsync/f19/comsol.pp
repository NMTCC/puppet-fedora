class profiles::nmt::rsync::f19::comsol {

  rsync::get { 'comsol':
    source => "update.nmt.edu::F19-comsol/usr/local/comsol43b",
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'comsol-desktop':
    source => "update.nmt.edu::F19-comsol/usr/local/share/applications/comsol.desktop",
    path => '/usr/local/share/applications/',
    times => true,
  }

  file { '/usr/local/bin/comsol':
    ensure => 'link',
    target => '/usr/local/comsol43b/bin/comsol',
    require => Rsync::Get['comsol'],
  }

}
