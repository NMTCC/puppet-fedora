class profiles::nmt::rsync::f19::matlab {

  rsync::get { 'matlab':
    source => 'update.nmt.edu::F19-matlab/usr/local/matlab-2013a',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'matlab-desktop':
    source => 'update.nmt.edu::F19-matlab/usr/local/share/applications/matlab.desktop',
    path => '/usr/local/share/applications/',
    times => true,
  }

  rsync::get { 'matlab-sh':
    source => 'update.nmt.edu::F19-matlab/etc/profile.d/matlab.sh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['matlab'],
  }

  rsync::get { 'matlab-csh':
    source => 'update.nmt.edu::F19-matlab/etc/profile.d/matlab.csh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['matlab'],
  }

}
