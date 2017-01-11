class profiles::nmt::deployment {

  define rmtemplate {
    if $::torrentscomplete.include?("${title}") {
      exec { "delete template ${title}":
        path    => '/bin:/usr/bin',
        command => "rm -rf /var/lib/transmission-daemon/downloads/${title}",
      }
    }
  }

  define rmtorrent {
    if $::torrentsactive.include?("${title}") {
      exec { "stop torrent ${title}":
        path    => '/bin:/usr/bin',
        command => "transmission-remote -t ${title} --remove-and-delete",
      }
    }
  }

  define gettorrent ($hash) {

    if ($::rootfree > 262144000) {

      unless $::torrentscomplete.include?("${title}") {
        exec { 'start transmission':
          provider => shell,
          path    => '/bin:/usr/bin',
          command  => 'runuser debian-transmission -s /bin/bash -c "/usr/bin/transmission-daemon -T -g /var/lib/transmission-daemon/.config/transmission-daemon --incomplete-dir /var/lib/transmission-daemon/downloads/incomplete"',
          unless   => 'pgrep transmission',
        }
      }

      unless $::torrentsactive.include?("${hash}") {
        exec { "start torrent ${hash}":
          path    => '/bin:/usr/bin',
          command => "transmission-remote -a http://duplicon.nmt.edu/${title}.torrent; sleep 2; transmission-remote -t ${hash} -U -D -SR -Bh -o -e 500 --no-utp; sleep 2",
          onlyif  => 'pgrep transmission',
        }
      }

    }

  }

  case $::operatingsystemmajrelease {
    '8': {
      class { 'profiles::nmt::deployment::jessie': }
    }
    default: {
      warning('No deployment configuration for this release version.')
    }
  }

}
