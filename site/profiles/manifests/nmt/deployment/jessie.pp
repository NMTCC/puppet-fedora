# deployment for Jessie
class profiles::nmt::deployment::jessie {

  $oldtemplates = [
    'Fall2015-master.1',
    'Spring2016-master.1',
    'Fall2016-master.1',
    'Fall2016-master.2',
    'Spring2017-master.1',
  ]

  $oldtorrents = [
    '72aa0aab14bb5cd243fb6bdc2c383b477c523356',
    '959af43d3db63709fff5db6d01259109fbd899b9',
    '65d0a33272f8de9effa8ab9adf77ca107659d14a',
    '6b10051ff0fd733544fae8e2ebce4d55ce733ece',
    'c51a49547a5122c8f73c322b63fdf4c851f2ff05',
  ]

  # deployment configuration
  $semester = 'Spring2017'
  $branch = 'master'
  $build = '2'
  $template = "${semester}-${branch}.${build}"
  $torrent = '71d1caa7d8a882ecfd3c75db7775fd24b3a2f408'
  $preseed = 'http://duplicon.nmt.edu/preseed/jessie'
  $syncpre = 'http://template.nmt.edu/images/Spring2017'

  rmtemplate { $oldtemplates: }
  rmtorrent { $oldtorrents: }
  gettorrent { $template: hash => $torrent, }

  file { '/usr/local/etc/template.conf':
    ensure  => present,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('profiles/template.conf.erb'),
  }

}
