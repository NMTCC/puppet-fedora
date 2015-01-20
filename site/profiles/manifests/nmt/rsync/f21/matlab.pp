class profiles::nmt::rsync::f21::matlab {

  file { 'matlab-2013a':
    ensure => 'absent',
    path => '/usr/local/matlab-2013a',
    recurse => true,
    purge => true,
    force => true,
  }

  rsync::get { 'matlab':
    source => 'update.nmt.edu::F21-matlab/matlab-r2014a',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

  rsync::get { 'matlab-desktop':
    source => 'update.nmt.edu::F21-matlab/matlab.desktop',
    path => '/usr/local/share/applications/',
    times => true,
  }

  rsync::get { 'matlab-sh':
    source => 'update.nmt.edu::F21-matlab/matlab.sh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['matlab'],
  }

  rsync::get { 'matlab-csh':
    source => 'update.nmt.edu::F21-matlab/matlab.csh',
    path => '/etc/profile.d/',
    times => true,
    require => Rsync::Get['matlab'],
  }

}
