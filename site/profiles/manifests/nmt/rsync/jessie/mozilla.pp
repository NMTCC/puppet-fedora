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
    path   => '/usr/share/applications/',
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
    path   => '/usr/share/applications/',
    times  => true,
  }

  define stupidicontricks {
    rsync::get { "firefox-${title}":
      source => "update.nmt.edu::Jessie-mozilla/icons/${title}/firefox-official.png",
      path   => "/usr/share/icons/hicolor/${title}/apps/",
      times  => true,
    }
    rsync::get { "thunderbird-${title}":
      source => "update.nmt.edu::Jessie-mozilla/icons/${title}/thunderbird-official.png",
      path   => "/usr/share/icons/hicolor/${title}/apps/",
      times  => true,
    }
  }

  stupidicontricks { '16x16': }
  stupidicontricks { '22x22': }
  stupidicontricks { '24x24': }
  stupidicontricks { '32x32': }
  stupidicontricks { '48x48': }
  stupidicontricks { '256x256': }

}
