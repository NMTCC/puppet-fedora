# rsync Maple
class profile::rsync::maple {

  exec { 'maple2016':
    command => 'rm -rf /usr/local/maple2016',
    onlyif  => 'test -e /usr/local/maple2016',
  }

  rsync::get { 'maple':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-maple/maple2017",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'maple-desktop':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-maple/maple2017.desktop",
    path    => '/usr/local/share/applications/maple.desktop',
    times   => true,
    require => File['/usr/local/share/applications'],
    notify  => Exec['xdg-desktop-menu'],
  }

  file { '/usr/local/bin/maple':
    ensure  => 'link',
    target  => '/usr/local/maple2017/bin/maple',
    require => Rsync::Get['maple'],
  }

  file { '/usr/local/bin/xmaple':
    ensure  => 'link',
    target  => '/usr/local/maple2017/bin/xmaple',
    require => Rsync::Get['maple'],
  }

}
