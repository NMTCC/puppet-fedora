# remove an old template
define profile::deployment::rmtemplate {
  if member($::torrentscomplete, $title) {
    exec { "delete template ${title}":
      command => "rm -rf /var/lib/transmission-daemon/downloads/${title}",
    }
  }
}
