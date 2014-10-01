class profiles::rsync::logo {
  rsync::get { 'logo':
    source => "update.nmt.edu::F19-logo",
    path => '/usr/local/' }

  file { '/usr/local/bin/starlogo':
    ensure => 'link',
    target => '/usr/local/starlogo-2.2/starlogo-unix' }

  file { '/usr/local/bin/netlogo':
    ensure => 'link',
    target => '/usr/local/netlogo-5.1.0/netlogo.sh' }
}
