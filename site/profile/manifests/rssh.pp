# Configure rssh
class profile::rssh {

  file_line {

    'rssh-scp':
      ensure  => present,
      path    => '/etc/rssh.conf',
      line    => 'allowscp',
      match   => '^#allowscp',
      require => Package['rssh'],;

    'rssh-sftp':
      ensure  => present,
      path    => '/etc/rssh.conf',
      line    => 'allowsftp',
      match   => '^#allowsftp',
      require => Package['rssh'],;

  }

}
