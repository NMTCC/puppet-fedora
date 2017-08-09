# Configure apt
class profile::apt {

  $moduleloc =
    "puppet:///modules/profile/${::operatingsystem}/${::operatingsystemmajrelease}"

  package { 'apt-transport-https': }

  class { 'apt':
    purge  => {
      'sources.list'   => true,
      'sources.list.d' => true,
      'preferences'    => true,
      'preferences.d'  => true,
    },
    update => {
      frequency => 'daily',
    },
  }

  apt::pin { 'erlang':
    packages => 'erlang-mode',
    release  => '*',
    priority => -1,
  }

  # import keys
  # apt-key output changed in Stretch, and apt::key
  # currently execs every run, so we have to do this... :\
  $keys = '/usr/local/share/apt-keys'

  file { $keys:
    ensure => directory,
    owner  => 'root',
    group  => 'staff',
    mode   => '2775',
  }

  include wget

  wget::fetch { 'google-linux-key':
    source      => 'https://dl.google.com/linux/linux_signing_key.pub',
    destination => "${keys}/",
    require     => File[$keys],
  }

  wget::fetch { 'puppet-key':
    source      => 'https://apt.puppet.com/pubkey.gpg',
    destination => "${keys}/",
    require     => File[$keys],
  }

  wget::fetch { 'nmt-key':
    source      => 'http://duplicon.nmt.edu/nmt/nmt.gpg.key',
    destination => "${keys}/",
    require     => File[$keys],
  }

  wget::fetch { 'obspy-key':
    source      =>
      'https://raw.githubusercontent.com/obspy/obspy/master/misc/debian/public.key',
    destination => "${keys}/",
    require     => File[$keys],
  }

  $gpgopts =
    '--fingerprint --with-colons --keyring /etc/apt/trusted.gpg --no-default-keyring'

  $google_fingerprint = '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991'
  $puppet_fingerprint = '6F6B15509CF8E59E6E469F327F438280EF8D349F'
  $nmt_fingerprint = '6B9BE830DEB754D51DA1EF5D9A316557DA217D04'
  $obspy_fingerprint = 'AB88DF222C40D448E99F0F07054D40E834811F05'

  exec { 'add-google-linux-key':
    command => "apt-key add ${keys}/linux_signing_key.pub",
    unless  => "gpg ${gpgopts} | grep ${google_fingerprint}",
    require => Wget::Fetch['google-linux-key'],
  }

  exec { 'add-puppet-key':
    command => "apt-key add ${keys}/pubkey.gpg",
    unless  => "gpg ${gpgopts} | grep ${puppet_fingerprint}",
    require => Wget::Fetch['puppet-key'],
  }

  exec { 'add-nmt-key':
    command => "apt-key add ${keys}/nmt.gpg.key",
    unless  => "gpg ${gpgopts} | grep ${nmt_fingerprint}",
    require => Wget::Fetch['nmt-key'],
  }

  exec { 'add-obspy-key':
    command => "apt-key add ${keys}/public.key",
    unless  => "gpg ${gpgopts} | grep ${obspy_fingerprint}",
    require => Wget::Fetch['obspy-key'],
  }

  # third party repos
  apt::source { 'google-chrome':
    location => 'http://dl.google.com/linux/chrome/deb/',
    release  => 'stable',
    repos    => 'main',
    include  => {
      'deb' => true,
    },
    require  => Exec['add-google-linux-key'],
  }

# Puppet is still signing with SHA1
# https://tickets.puppetlabs.com/browse/CPR-390
#  apt::source { 'puppet':
#    location => 'https://apt.puppet.com/',
#    release  => $::lsbdistcodename,
#    repos    => 'main dependencies',
#    include  => {
#      'deb' => true,
#    },
#    require  => [
#      Exec['add-puppet-key'],
#      Package['apt-transport-https'],
#    ],
#  }

  apt::source { 'nmt':
    location => 'http://duplicon.nmt.edu/nmt/debian/',
    release  => $::lsbdistcodename,
    repos    => 'main',
    include  => {
      'deb' => true,
    },
    require  => Exec['add-nmt-key'],
  }

# 20170719 - ObsPy has no stretch builds available
#  apt::source { 'obspy':
#    location => 'http://deb.obspy.org/',
#    release  => $::lsbdistcodename,
#    repos    => 'main',
#    include  => {
#      'deb' => true,
#    },
#    require  => Exec['add-obspy-key'],
#  }

  # standard repos
  apt::source { $::lsbdistcodename:
    location => 'http://duplicon.nmt.edu/debian/',
    release  => $::lsbdistcodename,
    repos    => 'main non-free contrib',
    include  => {
      'deb' => true,
    },
  }

  apt::source { "${::lsbdistcodename}-backports":
    location => 'http://duplicon.nmt.edu/debian/',
    release  => "${::lsbdistcodename}-backports",
    repos    => 'main non-free contrib',
    include  => {
      'deb' => true,
    },
  }

  apt::source { "${::lsbdistcodename}-security":
    location => 'http://duplicon.nmt.edu/debian-security/',
    release  => "${::lsbdistcodename}/updates",
    repos    => 'main non-free contrib',
    include  => {
      'deb' => true,
    },
  }

  apt::source { "${::lsbdistcodename}-updates":
    location => 'http://duplicon.nmt.edu/debian/',
    release  => "${::lsbdistcodename}-updates",
    repos    => 'main non-free contrib',
    include  => {
      'deb' => true,
    },
  }

  # config
  file { '/etc/apt/apt.conf.d/50appstream':
    ensure => absent,
  }

  file { '/etc/apt/apt.conf.d/99nmt':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => "Acquire::Languages \"none\";\n",
  }

  # timer to full-upgrade w/o breaking puppet OR cron
  file { '/usr/local/libexec/safeupgrade':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    content =>
      "#!/bin/bash\nDEBIAN_FRONTEND=noninteractive /bin/sleep \$((RANDOM % 600)) && /usr/bin/apt -y full-upgrade\n",
    require => File['/usr/local/libexec'],
  }

  file { '/etc/systemd/system/safeupgrade.service':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/usr/local/libexec/safeupgrade'],
  }

  file { '/etc/systemd/system/safeupgrade.timer':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File['/etc/systemd/system/safeupgrade.service'],
  }

  Ini_setting {
    ensure            => present,
    key_val_separator => '=',
  }

  ini_setting {

    'apt-service-description':
      path    => '/etc/systemd/system/safeupgrade.service',
      section => 'Unit',
      setting => 'Description',
      value   => 'Run apt upgrade',
      require => File['/etc/systemd/system/safeupgrade.service'],;

    'apt-service-type':
      path    => '/etc/systemd/system/safeupgrade.service',
      section => 'Service',
      setting => 'Type',
      value   => 'oneshot',
      require => File['/etc/systemd/system/safeupgrade.service'],;

    'apt-service-exec':
      path    => '/etc/systemd/system/safeupgrade.service',
      section => 'Service',
      setting => 'ExecStart',
      value   => '/usr/local/libexec/safeupgrade',
      require => File['/etc/systemd/system/safeupgrade.service'],;

    'apt-timer-description':
      path    => '/etc/systemd/system/safeupgrade.timer',
      section => 'Unit',
      setting => 'Description',
      value   => 'Run apt upgrade nightly',
      require => File['/etc/systemd/system/safeupgrade.timer'],;

    'apt-timer-oncalendar':
      path    => '/etc/systemd/system/safeupgrade.timer',
      section => 'Timer',
      setting => 'OnCalendar',
      value   => '04:17:00',
      require => File['/etc/systemd/system/safeupgrade.timer'],;

    'apt-timer-persistent':
      path    => '/etc/systemd/system/safeupgrade.timer',
      section => 'Timer',
      setting => 'Persistent',
      value   => true,
      require => File['/etc/systemd/system/safeupgrade.timer'],;

    'apt-timer-wantedby':
      path    => '/etc/systemd/system/safeupgrade.timer',
      section => 'Install',
      setting => 'WantedBy',
      value   => 'timers.target',
      require => File['/etc/systemd/system/safeupgrade.timer'],;

  }

  exec { 'safeupgrade-daemon-reload':
    command     => 'systemctl daemon-reload',
    subscribe   => [
      File['/etc/systemd/system/safeupgrade.service'],
      File['/etc/systemd/system/safeupgrade.timer'],
    ],
    refreshonly => true,
  }

  exec { 'safeupgrade-enable':
    command     => 'systemctl enable --now safeupgrade.timer',
    subscribe   => [
      File['/etc/systemd/system/safeupgrade.timer'],
    ],
    require     => [
      Exec['safeupgrade-daemon-reload'],
    ],
    refreshonly => true,
  }

  service { 'apt-daily.timer': enable => false, }
  service { 'apt-daily-upgrade.timer': enable => false, }

}
