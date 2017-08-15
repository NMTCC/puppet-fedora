# Templates for Debian Stretch
class profile::deployment::stretch {

  $oldtemplates = [
    'Spring2017-master.3',
  ]

  $oldtorrents = [
    '1f75bbcc246fac018212141c14c47b28cd8073ef',
  ]

  # deployment configuration
  $semester = 'Fall2017'
  $branch = 'master'
  $build = '1'
  $release = "${semester}-${branch}.${build}"
  $torrent = '24470d057aaa87beece9b3d450e6fd79ba1d30f4'
  $preseed = 'http://duplicon.nmt.edu/preseed/stretch'
  $syncpre = 'http://template.nmt.edu/images/Fall2017'

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
