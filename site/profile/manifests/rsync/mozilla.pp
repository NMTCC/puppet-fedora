# rsync Mozilla applications
class profile::rsync::mozilla {

  rsync::get { 'firefox':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-mozilla/firefox",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
    purge     => true,
    schedule  => 'rsync',
  }

  rsync::get { 'firefox-desktop':
    source  =>
      "duplicon.nmt.edu::${::lsbdistcodename}-mozilla/mozilla-firefox.desktop",
    path    => '/usr/local/share/applications/',
    times   => true,
    require => Rsync::Get['firefox'],
    notify  => Exec['xdg-desktop-menu'],
  }

  file { '/usr/local/bin/firefox-mozilla':
    ensure  => link,
    target  => '/usr/local/firefox/firefox',
    require => Rsync::Get['firefox'],
  }

  rsync::get { 'thunderbird':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-mozilla/thunderbird",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
    purge     => true,
    schedule  => 'rsync',
  }

  rsync::get { 'thunderbird-desktop':
    source  =>
      "duplicon.nmt.edu::${::lsbdistcodename}-mozilla/mozilla-thunderbird.desktop",
    path    => '/usr/local/share/applications/',
    times   => true,
    require => Rsync::Get['thunderbird'],
    notify  => Exec['xdg-desktop-menu'],
  }

  file { '/usr/local/bin/thunderbird-mozilla':
    ensure  => link,
    target  => '/usr/local/thunderbird/thunderbird',
    require => Rsync::Get['thunderbird'],
  }

  rsync::get { 'seamonkey':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-mozilla/seamonkey",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
    purge     => true,
    schedule  => 'rsync',
  }

  rsync::get { 'seamonkey-desktop':
    source  =>
      "duplicon.nmt.edu::${::lsbdistcodename}-mozilla/mozilla-seamonkey.desktop",
    path    => '/usr/local/share/applications/',
    times   => true,
    require => Rsync::Get['seamonkey'],
    notify  => Exec['xdg-desktop-menu'],
  }

  file { '/usr/local/bin/seamonkey':
    ensure  => link,
    target  => '/usr/local/seamonkey/seamonkey',
    require => Rsync::Get['seamonkey'],
  }

}
