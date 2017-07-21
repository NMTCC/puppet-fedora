# Configure basic stuff
class profile::base {

  File { '/usr/local/libexec':
    ensure => directory,
    owner  => 'root',
    group  => 'staff',
    mode   => '2775',
  }

  File { '/usr/local/share/applications':
    ensure => directory,
    owner  => 'root',
    group  => 'staff',
    mode   => '2775',
  }

}
