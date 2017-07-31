# Configure remctl commands
class profile::remctl {

  class { 'remctl::server':
    ensure    => present,
    debug     => false,
    only_from => ['129.138.0.0'],
    disable   => false,
  }

  remctl::server::aclfile { 'itc':
    ensure => present,
    acls   =>  [
      'dgraham@NMT.EDU',
      'jluster@NMT.EDU',
      'ken@NMT.EDU',
      'travis@NMT.EDU',
      'will@NMT.EDU',
    ],
  }

  remctl::server::command {

    'remreboot':
      ensure     => present,
      command    => 'remreboot',
      subcommand => 'ALL',
      executable => '/usr/local/libexec/remreboot',
      acls       =>  ["file:${remctl::server::acldir}/itc"],;

    'rrapp':
      ensure     => present,
      command    => 'rrapp',
      subcommand => 'ALL',
      executable => '/usr/local/libexec/rrapp',
      acls       => ["file:${remctl::server::acldir}/itc"],;

    'xorguser':
      ensure     => present,
      command    => 'xorguser',
      subcommand => 'ALL',
      executable => '/usr/local/libexec/xorg_user',
      acls       => ["file:${remctl::server::acldir}/itc"],;

  }

}
