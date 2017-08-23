# rsync MATLAB
class profile::rsync::matlab {

  exec { 'matlab-r2016a':
    command => 'rm -rf /usr/local/matlab-r2016a',
    onlyif  => 'test -e /usr/local/matlab-r2016a',
  }

  rsync::get { 'matlab':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-matlab/matlab-r2017a",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
    schedule  => 'rsync',
  }

  rsync::get { 'matlab-desktop':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-matlab/matlab-r2017a.desktop",
    path    => '/usr/local/share/applications/matlab.desktop',
    times   => true,
    require => [
      File['/usr/local/share/applications'],
      Rsync::Get['matlab'],
    ],
    notify  => Exec['xdg-desktop-menu'],
  }

  rsync::get { 'matlab-sh':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-matlab/matlab-r2017a.sh",
    path    => '/etc/profile.d/matlab.sh',
    times   => true,
    require => Rsync::Get['matlab'],
  }

  rsync::get { 'matlab-csh':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-matlab/matlab-r2017a.csh",
    path    => '/etc/csh/login.d/matlab.csh',
    times   => true,
    require => Rsync::Get['matlab'],
  }

}
