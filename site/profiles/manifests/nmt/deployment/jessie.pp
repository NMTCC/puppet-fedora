# deployment for Jessie
class profiles::nmt::deployment::jessie {

  $oldtemplates = [
    'Fall2015-master.1',
    'Spring2016-master.1',
    'Fall2016-master.1',
    'Fall2016-master.2',
  ]

  $oldtorrents = [
    '72aa0aab14bb5cd243fb6bdc2c383b477c523356',
    '959af43d3db63709fff5db6d01259109fbd899b9',
    '65d0a33272f8de9effa8ab9adf77ca107659d14a',
    '6b10051ff0fd733544fae8e2ebce4d55ce733ece',
  ]

  $template = 'Spring2017-master.1'
  $torrent = 'c51a49547a5122c8f73c322b63fdf4c851f2ff05'

  rmtemplate { $oldtemplates: }
  rmtorrent { $oldtorrents: }
  gettorrent { $template: hash => $torrent, }

}
