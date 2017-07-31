# remove an old torrent
define profile::deployment::rmtorrent {
  if member($::torrentsactive, $title) {
    exec { "stop torrent ${title}":
      command => "transmission-remote -t ${title} --remove-and-delete",
    }
  }
}
