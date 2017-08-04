# rsync chimera
class profile::rsync::chimera {

  rsync::get { 'chimera':
    source    =>
      "duplicon.nmt.edu::${::lsbdistcodename}-chimera/UCSF-Chimera64-1.11.2",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'chimera-icon':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-chimera/UCSF-Chimera.png",
    path    => '/usr/share/pixmaps/',
    times   => true,
    require => Rsync::Get['chimera'],
  }

  rsync::get { 'chimera-desktop':
    source  =>
      "duplicon.nmt.edu::${::lsbdistcodename}-chimera/UCSF-Chimera64-1.11.2.desktop",
    path    => '/usr/local/share/applications/UCSF-Chimera64.desktop',
    times   => true,
    require => Rsync::Get['chimera-icon'],
    notify  => Exec['xdg-desktop-menu'],
  }

  file { '/usr/local/bin/chimera':
    ensure  => link,
    target  => '/usr/local/UCSF-Chimera64-1.11.2/bin/chimera',
    require => Rsync::Get['chimera'],
  }

}
