class profiles::nmt::rsync::jessie::chimera {

  rsync::get { 'chimera':
    source    => 'duplicon.nmt.edu::Jessie-chimera/UCSF-Chimera64-1.10.2',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'chimera-desktop':
    source  => 'duplicon.nmt.edu::Jessie-chimera/UCSF-Chimera64-1.10.2.desktop',
    path    => '/usr/local/share/applications/',
    times   => true,
    require => Rsync::Get['chimera'],
  }

  file { '/usr/bin/chimera':
    ensure  => 'link',
    target  => '/usr/local/UCSF-Chimera64-1.10.2/bin/chimera',
    require => Rsync::Get['chimera'],
  }

}
