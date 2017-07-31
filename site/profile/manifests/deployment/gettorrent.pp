# torrent updated templates
define profile::deployment::gettorrent ($hash) {

  if ($::rootfree > 262144000) {

    $tdpath = '/var/lib/transmission-daemon'
    $subcmd = "/usr/bin/transmission-daemon -T -g ${tdpath}/.config/transmission-daemon --incomplete-dir ${tdpath}/downloads/incomplete"

    unless member($::torrentscomplete, $title) {
      exec { 'start transmission':
        provider => shell,
        command  =>
          "runuser debian-transmission -s /bin/bash -c \"${subcmd}\"; sleep 2",
        unless   => 'pgrep transmission',
      }
    }

    unless member($::torrentsactive, $hash) {
      exec { "start torrent ${hash}":
        command => "transmission-remote -a http://duplicon.nmt.edu/${title}.torrent; sleep 2; transmission-remote -t ${hash} -U -D -SR -Bh -o -e 500 --no-utp; sleep 2",
        onlyif  => 'pgrep transmission',
      }
    }

  }

}
