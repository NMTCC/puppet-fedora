class profiles::nmt::rsync::jessie::chimera {

  exec { 'chimera-1.10.2':
    path    => '/bin:/usr/bin',
    command => 'rm -rf /usr/local/UCSF-Chimera64-1.10.2',
    onlyif  => 'test -e /usr/local/UCSF-Chimera64-1.10.2',
  }

  exec { 'chimera-1.10.2-desktop':
    path    => '/bin:/usr/bin',
    command => 'rm -f /usr/local/share/applications/UCSF-Chimera64-1.10.2.desktop',
    onlyif  => 'test -e /usr/local/share/applications/UCSF-Chimera64-1.10.2.desktop',
  }

  rsync::get { 'chimera':
    source    => 'duplicon.nmt.edu::Jessie-chimera/UCSF-Chimera64-1.11',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'chimera-desktop':
    source  => 'duplicon.nmt.edu::Jessie-chimera/UCSF-Chimera64-1.11.desktop',
    path    => '/usr/local/share/applications/UCSF-Chimera64.desktop',
    times   => true,
    require => Rsync::Get['chimera'],
  }

  file { '/usr/bin/chimera':
    ensure  => 'link',
    target  => '/usr/local/UCSF-Chimera64-1.11/bin/chimera',
    require => Rsync::Get['chimera'],
  }

}
