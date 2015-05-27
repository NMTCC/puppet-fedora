class profiles::nmt::rsync::jessie::mozilla {

  rsync::get { 'firefox':
    source    => 'update.nmt.edu::Jessie-mozilla/firefox',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
    purge     => true,
  }

  rsync::get { 'firefox-desktop':
    source => 'update.nmt.edu::Jessie-mozilla/firefox.desktop',
    path   => '/usr/local/share/applications/',
    times  => true,
  }

  rsync::get { 'firefox-icon':
    source => 'update.nmt.edu::Jessie-mozilla/firefox.png',
    path   => '/usr/share/icons/hicolor/256x256/apps/',
    times  => true,
  }

  rsync::get { 'thunderbird':
    source    => 'update.nmt.edu::Jessie-mozilla/thunderbird',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
    purge     => true,
  }

  rsync::get { 'thunderbird-desktop':
    source => 'update.nmt.edu::Jessie-mozilla/thunderbird.desktop',
    path   => '/usr/local/share/applications/',
    times  => true,
  }

  rsync::get { 'thunderbird-icon':
    source => 'update.nmt.edu::Jessie-mozilla/thunderbird.png',
    path   => '/usr/share/icons/hicolor/256x256/apps/',
    times  => true,
  }

}
