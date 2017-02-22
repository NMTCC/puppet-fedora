class profiles::nmt::rsync::stretch::mozilla {

  rsync::get { 'firefox':
    source    => 'duplicon.nmt.edu::Stretch-mozilla/firefox',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
    purge     => true,
  }

  rsync::get { 'firefox-desktop':
    source => 'duplicon.nmt.edu::Stretch-mozilla/firefox.desktop',
    path   => '/usr/local/share/applications/',
    times  => true,
    require => Rsync::Get['firefox'],
  }

  rsync::get { 'firefox-icon':
    source => 'duplicon.nmt.edu::Stretch-mozilla/firefox.png',
    path   => '/usr/share/icons/hicolor/256x256/apps/',
    times  => true,
    require => Rsync::Get['firefox'],
  }

  file { '/usr/bin/firefox.real':
    ensure  => 'link',
    target  => '/usr/local/firefox/firefox',
    require => Rsync::Get['firefox'],
  }

  rsync::get { 'thunderbird':
    source    => 'duplicon.nmt.edu::Stretch-mozilla/thunderbird',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
    purge     => true,
  }

  rsync::get { 'thunderbird-desktop':
    source => 'duplicon.nmt.edu::Stretch-mozilla/thunderbird.desktop',
    path   => '/usr/local/share/applications/',
    times  => true,
    require => Rsync::Get['thunderbird'],
  }

  rsync::get { 'thunderbird-icon':
    source => 'duplicon.nmt.edu::Stretch-mozilla/thunderbird.png',
    path   => '/usr/share/icons/hicolor/256x256/apps/',
    times  => true,
    require => Rsync::Get['thunderbird'],
  }

  file { '/usr/bin/thunderbird':
    ensure  => 'link',
    target  => '/usr/local/thunderbird/thunderbird',
    require => Rsync::Get['thunderbird'],
  }

}
