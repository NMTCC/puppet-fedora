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

  define stupidicontricks {
    rsync::get { "firefox-${title}":
      source => "update.nmt.edu::Jessie-mozilla/icons/${title}/firefox.png",
      path   => "/usr/share/icons/hicolor/${title}/apps/",
      times  => true,
    }
    rsync::get { "thunderbird-${title}":
      source => "update.nmt.edu::Jessie-mozilla/icons/${title}/thunderbird.png",
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

  define morestupidicontricks {
    file { "/usr/share/icons/nuoveXT2/${title}/apps/firefox.png":
      ensure => 'absent',
      backup => 'false',
    }
    file { "/usr/share/icons/nuoveXT2/${title}/apps/mozilla-firefox.png":
      ensure => 'absent',
      backup => 'false',
    }
    file { "/usr/share/icons/nuoveXT2/${title}/apps/thunderbird.png":
      ensure => 'absent',
      backup => 'false',
    }
    file { "/usr/share/icons/nuoveXT2/${title}/apps/mozilla-thunderbird.png":
      ensure => 'absent',
      backup => 'false',
    }
  }

  morestupidicontricks { '16x16': }
  morestupidicontricks { '22x22': }
  morestupidicontricks { '24x24': }
  morestupidicontricks { '32x32': }
  morestupidicontricks { '36x36': }
  morestupidicontricks { '48x48': }
  morestupidicontricks { '64x64': }
  morestupidicontricks { '72x72': }
  morestupidicontricks { '96x96': }
  morestupidicontricks { '128x128': }

}
