# Templates for Debian Stretch
class profile::deployment::stretch {

  $oldtemplates = [
    'Spring2017-master.2',
  ]

  $oldtorrents = [
    '71d1caa7d8a882ecfd3c75db7775fd24b3a2f408',
  ]

  # deployment configuration
  $semester = 'Spring2017'
  $branch = 'master'
  $build = '3'
  $release = "${semester}-${branch}.${build}"
  $torrent = '1f75bbcc246fac018212141c14c47b28cd8073ef'
  $preseed = 'http://duplicon.nmt.edu/preseed/stretch'
  $syncpre = 'http://template.nmt.edu/images/Spring2017'

  profile::deployment::rmtemplate { $oldtemplates: }
  profile::deployment::rmtorrent { $oldtorrents: }
  profile::deployment::gettorrent { $release: hash => $torrent, }

  file { '/usr/local/etc/template.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('profile/template.conf.erb'),
  }

}
