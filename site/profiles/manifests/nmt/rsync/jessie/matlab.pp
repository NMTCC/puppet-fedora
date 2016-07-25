class profiles::nmt::rsync::jessie::matlab {

  exec { 'matlab-r2015a':
    path => '/bin:/usr/bin/',
    command => 'rm -rf /usr/local/matlab-r2015a',
    onlyif => 'test -e /usr/local/matlab-r2015a',
  }

  rsync::get { 'matlab':
    source => 'duplicon.nmt.edu::Jessie-matlab/matlab-r2016a',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'matlab-desktop':
    source => 'duplicon.nmt.edu::Jessie-matlab/matlab-r2016a.desktop',
    path => '/usr/local/share/applications/matlab.desktop',
    times => true,
    require => Rsync::Get['matlab'],
  }

  rsync::get { 'matlab-sh':
    source => 'duplicon.nmt.edu::Jessie-matlab/matlab-r2016a.sh',
    path => '/etc/profile.d/matlab.sh',
    times => true,
    require => Rsync::Get['matlab'],
  }

  rsync::get { 'matlab-csh':
    source => 'duplicon.nmt.edu::Jessie-matlab/matlab-r2016a.csh',
    path => '/etc/profile.d/matlab.csh',
    times => true,
    require => Rsync::Get['matlab'],
  }

}
