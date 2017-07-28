# Configure mail clients
class profile::mail {

  $moduleloc =
    "puppet:///modules/profile/${::operatingsystem}/${::operatingsystemmajrelease}"

  file { '/etc/Muttrc.d/nmtmutt.rc':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => "${moduleloc}/nmtmutt.rc",
    require => Package['mutt'],
  }

  file { '/etc/pine.conf':
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => "${moduleloc}/pine.conf",
    require => Package['alpine'],
  }

}
