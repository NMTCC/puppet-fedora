# Configure basic stuff
class profile::base {

  File { 'libexec':
    ensure => directory,
    path   => '/usr/local/libexec',
    owner  => 'root',
    group  => 'staff',
    mode   => '2775',
  }

}
