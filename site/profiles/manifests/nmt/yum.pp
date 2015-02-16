# class profiles::nmt::yum

class profiles::nmt::yum {

  define gpgrepo ($descr = absent, $baseurl, $gpgkey, $metadata_expire = absent, $enabled = 0) {
    yumrepo { $title :
      name => $title,
      descr => $descr,
      baseurl => $baseurl,
      gpgkey => $gpgkey,
      metadata_expire => $metadata_expire,
      enabled => $enabled,
      gpgcheck => 1
    }
  }

  define disabledrepo {
    yumrepo { $title :
      name => $title,
      enabled => 0,
    }
  }

  define removerepo {
    file { "${title}.repo" :
      path   => '/etc/yum.repos.d',
      ensure => 'absent',
      force  => 'true',
    }
  }

  define enabledgpgrepo ($descr = absent, $baseurl, $gpgkey, $metadata_expire = absent) {
    gpgrepo { $title : 
      descr => $descr,
      baseurl => $baseurl,
      gpgkey => $gpgkey,
      metadata_expire => $metadata_expire,
      enabled => 1,
    }
  }

  case $::operatingsystemrelease {
    '19': {
      class { "profiles::nmt::yum::f19": }
    }
    '21': {
      class { "profiles::nmt::yum::f21": }
    }
    default: {
      warning('No repositories for this release version.')
    }
  }

}
