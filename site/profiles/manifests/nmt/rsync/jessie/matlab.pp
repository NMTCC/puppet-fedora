class profiles::nmt::rsync::jessie::matlab {

  exec { 'matlab-2014a':
    path => '/bin:/usr/bin/',
    command => 'rm -rf /usr/local/matlab-2014a',
    onlyif => 'test -e /usr/local/matlab-2014a',
  }

  rsync::get { 'matlab':
    source => 'update.nmt.edu::Jessie-matlab/matlab-r2015a',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'matlab-desktop':
    source => 'update.nmt.edu::Jessie-matlab/matlab.desktop',
    path => '/usr/local/share/applications/',
    times => true,
  }

  rsync::get { 'matlab-sh':
    source => 'update.nmt.edu::Jessie-matlab/matlab.sh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['matlab'],
  }

  rsync::get { 'matlab-csh':
    source => 'update.nmt.edu::Jessie-matlab/matlab.csh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['matlab'],
  }

}
