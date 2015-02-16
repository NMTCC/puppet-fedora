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
  enabledgpgrepo { 'puppetlabs-products':
    descr => 'Puppet Labs Products Fedora $releasever - $basearch',
    baseurl => 'http://yum.puppetlabs.com/fedora/f$releasever/products/$basearch',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }
  enabledgpgrepo { 'puppetlabs-deps':
    descr => 'Puppet Labs Dependencies Fedora $releasever - $basearch',
    baseurl => 'http://yum.puppetlabs.com/fedora/f$releasever/dependencies/$basearch',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-puppetlabs',
  }



  enabledgpgrepo { 'tcc-fedora':
    descr => 'TCC Fedora $releasever - $basearch',
    baseurl => 'http://replicon.nmt.edu/fedora/linux/releases/$releasever/Everything/$basearch/os/',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch-primary',
  }
  enabledgpgrepo { 'tcc-fedora-updates':
    descr => 'TCC Fedora $releasever - $basearch - Updates',
    baseurl => 'http://replicon.nmt.edu/fedora/linux/updates/$releasever/$basearch/',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$basearch-primary',
  }
  enabledgpgrepo { 'tcc-rpmfusion-free':
    descr => 'TCC RPM Fusion for Fedora $releasever - Free',
    baseurl => 'http://replicon.nmt.edu/rpmfusion/free/fedora/releases/$releasever/Everything/$basearch/os/',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-primary',
  }
  enabledgpgrepo { 'tcc-rpmfusion-free-updates':
    descr => 'TCC RPM Fusion for Fedora $releasever - Free - Updates',
    baseurl => 'http://replicon.nmt.edu/rpmfusion/free/fedora/updates/$releasever/$basearch/',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-free-fedora-$releasever-primary',
  }
  enabledgpgrepo { 'tcc-rpmfusion-nonfree':
    descr => 'TCC RPM Fusion for Fedora $releasever - Nonfree',
    baseurl => 'http://replicon.nmt.edu/rpmfusion/nonfree/fedora/releases/$releasever/Everything/$basearch/os/',
    metadata_expire => '7d',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-primary',
  }
  enabledgpgrepo { 'tcc-rpmfusion-nonfree-updates':
    descr => 'TCC RPM Fusion for Fedora $releasever - Nonfree - Updates',
    baseurl => 'http://replicon.nmt.edu/rpmfusion/nonfree/fedora/updates/$releasever/$basearch/',
    gpgkey => 'file:///etc/pki/rpm-gpg/RPM-GPG-KEY-rpmfusion-nonfree-fedora-$releasever-primary',
  }
  yumrepo { 'tcc-update':
    descr => 'TCC Local Packages for Fedora $releasever',
    baseurl => 'http://update.nmt.edu/tcc/fedora/$releasever/$basearch/',
    gpgcheck => 0,
  }
  yumrepo { 'tcc-update-source':
    descr => 'TCC Local Packages for Fedora $releasever - Source',
    baseurl => 'http://update.nmt.edu/tcc/fedora/$releasever/source/SRPMS/',
    gpgcheck => 0,
  }

  removerepo { 'fedora': }
  removerepo { 'fedora-debuginfo': }
  removerepo { 'fedora-source': }
  removerepo { 'updates': }
  removerepo { 'updates-debuginfo': }
  removerepo { 'updates-source': }
  removerepo { 'updates-testing': }
  removerepo { 'updates-testing-debuginfo': }
  removerepo { 'updates-testing-source': }
  removerepo { 'rpmfusion-free-rawhide': }
  removerepo { 'rpmfusion-free-rawhide-debuginfo': }
  removerepo { 'rpmfusion-free-rawhide-source': }
  removerepo { 'rpmfusion-nonfree-rawhide': }
  removerepo { 'rpmfusion-nonfree-rawhide-debuginfo': }
  removerepo { 'rpmfusion-nonfree-rawhide-source': }
  removerepo { 'rpmfusion-free': }
  removerepo { 'rpmfusion-free-debuginfo': }
  removerepo { 'rpmfusion-free-source': }
  removerepo { 'rpmfusion-nonfree': }
  removerepo { 'rpmfusion-nonfree-debuginfo': }
  removerepo { 'rpmfusion-nonfree-source': }
  removerepo { 'rpmfusion-free-updates': }
  removerepo { 'rpmfusion-free-updates-debuginfo': }
  removerepo { 'rpmfusion-free-updates-source': }
  removerepo { 'rpmfusion-nonfree-updates': }
  removerepo { 'rpmfusion-nonfree-updates-debuginfo': }
  removerepo { 'rpmfusion-nonfree-updates-source': }
  removerepo { 'rpmfusion-free-updates-testing': }
  removerepo { 'rpmfusion-free-updates-testing-debuginfo': }
  removerepo { 'rpmfusion-free-updates-testing-source': }
  removerepo { 'rpmfusion-nonfree-updates-testing': }
  removerepo { 'rpmfusion-nonfree-updates-testing-debuginfo': }
  removerepo { 'rpmfusion-nonfree-updates-testing-source': }
  removerepo { 'tcc-fedora-debuginfo': }
  removerepo { 'tcc-fedora-updates-debuginfo': }


  file { '/etc/pki/rpm-gpg':
    ensure => 'directory', recurse => 'remote',
    group => 'root', owner => 'root',
    source => "${moduleloc}",
  }

}
