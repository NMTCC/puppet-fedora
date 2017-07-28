# Configure smartd
class profile::smartd {

  $mailcmd = 'echo -e "$SMARTD_MESSAGE""\n\nSincerely,\n$(hostname -f)" | mail -r "$(hostname -s)" -s "$SMARTD_FAILTYPE" "$SMARTD_ADDRESS"'

  file { '/usr/local/libexec/smartdnotify':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content => "#!/bin/sh\n${mailcmd}\n",
  }

  file_line { 'smartd-devicescan':
    ensure  => present,
    path    => '/etc/smartd.conf',
    line    => 'DEVICESCAN -H -m itc-smartd@nmt.edu -M exec /usr/local/libexec/smartdnotify -n standby,10,q',
    match   => '^DEVICESCAN',
    require => File['/usr/local/libexec/smartdnotify'],
  }

  service { 'smartd':
    ensure    => running,
    enable    => true,
    subscribe => File_line['smartd-devicescan'],
  }

}
