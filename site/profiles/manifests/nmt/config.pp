# class profiles::nmt::config

class profiles::nmt::config {

  $moduleloc = "puppet:///modules/profiles/${operatingsystem}/config/${operatingsystemrelease}"

  File {
    owner => 'root',
    group => 'root',
    ensure => 'file',
    backup => false,
  }

  define ln ($target) {
    file { $title :
      ensure => 'link',
      target => $target,
    }
  }

  define configfile ($dest, $mode = '0644') {
    file { $title :
      mode   => $mode,
      source => "${profiles::nmt::config::moduleloc}/${$title}",
      path   => "${dest}/${title}",
    }
  }

  define configscript ($dest, $mode = '0755') {
    configfile { $title :
      mode => $mode,
      dest => $dest,
    }
  }

  define emptyfile ($mode = '0644') {
    file { $title :
      mode    => $mode,
      content => '',
    }
  }

  define configdir ($dest, $recurse = 'remote') {
    file { $title :
      source  => "${profiles::nmt::config::moduleloc}/${$title}",
      path    => "${dest}/${title}",
      recurse => $recurse,
      ensure  => 'directory',
      links   => 'manage',
    }
  }

  define nofile () {
    file { $title :
      ensure => 'absent',
      force  => 'true',
    }
  }

  case $::operatingsystemrelease {
    '19': {
      class { "profiles::nmt::config::f19": }
    }
    '21': {
      class { "profiles::nmt::config::f21": }
    }
    default: {
      warning('No config for this release version.')
    }
  }

}
