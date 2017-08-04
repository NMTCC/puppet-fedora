# rsync COMSOL
class profile::rsync::comsol {

  exec { 'comsol52a':
    command => 'rm -rf /usr/local/comsol52a',
    onlyif  => 'test -e /usr/local/comsol52a',
  }

  rsync::get { 'comsol':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-comsol/comsol53",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'comsol-desktop':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-comsol/comsol53.desktop",
    path    => '/usr/local/share/applications/comsol.desktop',
    times   => true,
    require => [
      File['/usr/local/share/applications'],
      Rsync::Get['comsol'],
    ],
    notify  => Exec['xdg-desktop-menu'],
  }

  rsync::get { 'comsolsh':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-comsol/comsol53.sh",
    path    => '/usr/local/bin/comsol',
    times   => true,
    require => Rsync::Get['comsol'],
  }

}
