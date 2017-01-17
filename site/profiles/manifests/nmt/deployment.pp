# manage torrent and template data
class profiles::nmt::deployment {

  # remove and old template
  define rmtemplate {
    if member($::torrentscomplete, $title) {
      exec { "delete template ${title}":
        path    => '/bin:/usr/bin',
        command => "rm -rf /var/lib/transmission-daemon/downloads/${title}",
      }
    }
  }

  # remove and old torrent
  define rmtorrent {
    if member($::torrentsactive, $title) {
      exec { "stop torrent ${title}":
        path    => '/bin:/usr/bin',
        command => "transmission-remote -t ${title} --remove-and-delete",
      }
    }
  }

  # torrent updated templates
  define gettorrent ($hash) {

    if ($::rootfree > 262144000) {

      unless member($::torrentscomplete, $title) {
        exec { 'start transmission':
          provider => shell,
          path     => '/bin:/usr/bin:/sbin',
          command  => 'runuser debian-transmission -s /bin/bash -c "/usr/bin/transmission-daemon -T -g /var/lib/transmission-daemon/.config/transmission-daemon --incomplete-dir /var/lib/transmission-daemon/downloads/incomplete"; sleep 2',
          unless   => 'pgrep transmission',
        }
      }

      unless member($::torrentsactive, $hash) {
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
      include profiles::nmt::deployment::jessie
    }
    default: {
      warning('No deployment configuration for this release version.')
    }
  }

}
