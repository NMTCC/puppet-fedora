# Templates for Debian Stretch
class profile::deployment::stretch {

  $oldtemplates = [
    'Spring2017-master.3',
    'Fall2017-master.1',
  ]

  $oldtorrents = [
    '1f75bbcc246fac018212141c14c47b28cd8073ef',
    '24470d057aaa87beece9b3d450e6fd79ba1d30f4',
  ]

  # deployment configuration
  $semester = 'Spring2018'
  $branch = 'master'
  $build = '1'
  $release = "${semester}-${branch}.${build}"
  $torrent = '8ac048b2d8c778cc5106f3e52ced9420976d0889'
  $preseed = 'http://duplicon.nmt.edu/preseed/stretch'
  $syncpre = 'http://template.nmt.edu/images/Spring2018'

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
