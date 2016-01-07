class profiles::nmt::spring2016 {

  if ($::template == 'dual-boot') {

    exec { 'reseed':
      path    => '/bin:/usr/bin',
      command => 'runuser debian-transmission -s /bin/bash -c "/usr/bin/transmission-daemon -T -g /var/lib/transmission-daemon/.config/transmission-daemon --incomplete-dir /var/lib/transmission-daemon/downloads/incomplete"; transmission-remote -t 6e4bec907c8efb58c62b108dc0fec9a62aee4ef1 --remove-and-delete; wget -q -P /tmp http://duplicon.nmt.edu/Fall2015-master.1.torrent; transmission-remote -a /tmp/Fall2015-master.1.torrent; transmission-remote -t 72aa0aab14bb5cd243fb6bdc2c383b477c523356 -U -D -SR -Bh -o -e 500 --no-utp',
      unless  => 'pgrep transmission-daemon',
    }

  }

}
