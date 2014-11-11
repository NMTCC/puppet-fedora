# class profiles::nmt::yum

class profiles::nmt::yum::f21 {

  $moduleloc = "puppet:///modules/profiles/${operatingsystem}/yum/${operatingsystemmajrelease}"

  enabledgpgrepo { 'google-chrome':
    descr => 'google-chrome',
    baseurl => 'http://dl.google.com/linux/chrome/rpm/stable/x86_64/',
    gpgkey => 'https://dl-ssl.google.com/linux/linux_signing_key.pub',
  }
  enabledgpgrepo { 'adobe-linux':
    descr => 'Adobe Systems Incorporated',
    baseurl => 'http://linuxdownload.adobe.com/linux/x86_64/',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux',
  }
  enabledgpgrepo { 'adobe-linux-i386':
    descr => 'Adobe Systems Incorporated',
    baseurl => 'http://linuxdownload.adobe.com/linux/i386/',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-adobe-linux',
  }
#  enabledgpgrepo { 'puppetlabs-products':
#    descr => 'Puppet Labs Products Fedora $releasever - $basearch',
#    baseurl => 'http://yum.puppetlabs.com/fedora/f$releasever/products/$basearch',
#    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
#  }
#  enabledgpgrepo { 'puppetlabs-deps':
#    descr => 'Puppet Labs Dependencies Fedora $releasever - $basearch',
#    baseurl => 'http://yum.puppetlabs.com/fedora/f$releasever/dependencies/$basearch',
#    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
#  }



  enabledgpgrepo { 'tcc-fedora':
    descr => 'TCC Fedora $releasever - $basearch',
    baseurl => 'http://replicon.nmt.edu/fedora/linux/development/$releasever/$basearch/os/',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch-primary',
  }
  enabledgpgrepo { 'tcc-fedora-debuginfo':
    descr => 'TCC Fedora $releasever - $basearch - Debug',
    baseurl => 'http://replicon.nmt.edu/fedora/linux/development/$releasever/$basearch/debug/',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch-primary',
  }
  enabledgpgrepo { 'tcc-fedora-updates':
    descr => 'TCC Fedora $releasever - $basearch - Updates',
    baseurl => 'http://replicon.nmt.edu/fedora/linux/updates/testing/$releasever/$basearch/',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch-primary',
  }
  enabledgpgrepo { 'tcc-fedora-updates-debuginfo':
    descr => 'TCC Fedora $releasever - $basearch - Updates - Debug',
    baseurl => 'http://replicon.nmt.edu/fedora/linux/updates/testing/$releasever/$basearch/debug/',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch-primary',
  }
  enabledgpgrepo { 'tcc-rpmfusion-free':
    descr => 'TCC RPM Fusion for Fedora $releasever - Free',
    baseurl => 'http://replicon.nmt.edu/rpmfusion/free/fedora/development/$releasever/$basearch/os/',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-primary',
  }
#  enabledgpgrepo { 'tcc-rpmfusion-free-updates':
#    descr => 'TCC RPM Fusion for Fedora $releasever - Free - Updates',
#    baseurl => 'http://replicon.nmt.edu/rpmfusion/free/fedora/updates/$releasever/$basearch/',
#    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-$basearch',
#  }
  enabledgpgrepo { 'tcc-rpmfusion-nonfree':
    descr => 'TCC RPM Fusion for Fedora $releasever - Nonfree',
    baseurl => 'http://replicon.nmt.edu/rpmfusion/nonfree/fedora/development/$releasever/$basearch/os/',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-primary',
  }
#  enabledgpgrepo { 'tcc-rpmfusion-nonfree-updates':
#    descr => 'TCC RPM Fusion for Fedora $releasever - Nonfree - Updates',
#    baseurl => 'http://replicon.nmt.edu/rpmfusion/nonfree/fedora/updates/$releasever/$basearch/',
#    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-$basearch',
#  }
  enabledgpgrepo { 'tcc-update':
    descr => 'TCC Local Packages for Fedora $releasever',
    baseurl => 'http://update.nmt.edu/tcc/fedora/$releasever/$basearch/',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-tcc-update',
  }
  enabledgpgrepo { 'tcc-update-source':
    descr => 'TCC Local Packages for Fedora $releasever - Source',
    baseurl => 'http://update.nmt.edu/tcc/fedora/$releasever/source/SRPMS/',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-tcc-update',
  }


  disabledrepo { 'fedora': }
  disabledrepo { 'fedora-debuginfo': }
  disabledrepo { 'fedora-source': }
  disabledrepo { 'updates': }
  disabledrepo { 'updates-debuginfo': }
  disabledrepo { 'updates-source': }
  disabledrepo { 'updates-testing': }
  disabledrepo { 'updates-testing-debuginfo': }
  disabledrepo { 'updates-testing-source': }
  disabledrepo { 'rpmfusion-free-rawhide': }
  disabledrepo { 'rpmfusion-free-rawhide-debuginfo': }
  disabledrepo { 'rpmfusion-free-rawhide-source': }
  disabledrepo { 'rpmfusion-nonfree-rawhide': }
  disabledrepo { 'rpmfusion-nonfree-rawhide-debuginfo': }
  disabledrepo { 'rpmfusion-nonfree-rawhide-source': }
  disabledrepo { 'rpmfusion-free': }
  disabledrepo { 'rpmfusion-free-debuginfo': }
  disabledrepo { 'rpmfusion-free-source': }
  disabledrepo { 'rpmfusion-nonfree': }
  disabledrepo { 'rpmfusion-nonfree-debuginfo': }
  disabledrepo { 'rpmfusion-nonfree-source': }
  disabledrepo { 'rpmfusion-free-updates': }
  disabledrepo { 'rpmfusion-free-updates-debuginfo': }
  disabledrepo { 'rpmfusion-free-updates-source': }
  disabledrepo { 'rpmfusion-nonfree-updates': }
  disabledrepo { 'rpmfusion-nonfree-updates-debuginfo': }
  disabledrepo { 'rpmfusion-nonfree-updates-source': }
  disabledrepo { 'rpmfusion-free-updates-testing': }
  disabledrepo { 'rpmfusion-free-updates-testing-debuginfo': }
  disabledrepo { 'rpmfusion-free-updates-testing-source': }
  disabledrepo { 'rpmfusion-nonfree-updates-testing': }
  disabledrepo { 'rpmfusion-nonfree-updates-testing-debuginfo': }
  disabledrepo { 'rpmfusion-nonfree-updates-testing-source': }


  file { '/etc/pki/rpm-gpg':
    ensure => 'directory', recurse => 'remote',
    group => 'root', owner => 'root',
    source => "${moduleloc}",
  }

}
