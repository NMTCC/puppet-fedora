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
    source => 'duplicon.nmt.edu::Stretch-mozilla/mozilla-firefox.desktop',
    path   => '/usr/local/share/applications/',
    times  => true,
    require => Rsync::Get['firefox'],
  }

  rsync::get { 'firefox-icon':
    source => 'duplicon.nmt.edu::Stretch-mozilla/mozilla-firefox.png',
    path   => '/usr/share/pixmaps/',
    times  => true,
    require => Rsync::Get['firefox'],
  }

  file { '/usr/bin/firefox-stable':
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
    source => 'duplicon.nmt.edu::Stretch-mozilla/mozilla-thunderbird.desktop',
    path   => '/usr/local/share/applications/',
    times  => true,
    require => Rsync::Get['thunderbird'],
  }

  rsync::get { 'thunderbird-icon':
    source => 'duplicon.nmt.edu::Stretch-mozilla/mozilla-thunderbird.png',
    path   => '/usr/share/pixmaps/',
    times  => true,
    require => Rsync::Get['thunderbird'],
  }

  file { '/usr/bin/thunderbird':
    ensure  => 'link',
    target  => '/usr/local/thunderbird/thunderbird',
    require => Rsync::Get['thunderbird'],
  }

  rsync::get { 'seamonkey':
    source    => 'duplicon.nmt.edu::Stretch-mozilla/seamonkey',
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
    purge     => true,
  }

  rsync::get { 'seamonkey-desktop':
    source => 'duplicon.nmt.edu::Stretch-mozilla/mozilla-seamonkey.desktop',
    path   => '/usr/local/share/applications/',
    times  => true,
    require => Rsync::Get['seamonkey'],
  }

  rsync::get { 'seamonkey-icon':
    source => 'duplicon.nmt.edu::Stretch-mozilla/mozilla-seamonkey.png',
    path   => '/usr/share/pixmaps/',
    times  => true,
    require => Rsync::Get['seamonkey'],
  }

  file { '/usr/bin/seamonkey':
    ensure  => 'link',
    target  => '/usr/local/seamonkey/seamonkey',
    require => Rsync::Get['seamonkey'],
  }

}
