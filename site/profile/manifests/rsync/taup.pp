# rsync TauP
class profile::rsync::taup {

  # TauP Toolkit
  # GEOP 524 (Observational Earthquake Seismology)
  # Dr. Susan Bilek
  # Requested 14 Jul 2016

  rsync::get { 'taup':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-taup/TauP-2.4.3",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'taup-sh':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-taup/taup.sh",
    path    => '/etc/profile.d/',
    times   => true,
    require => Rsync::Get['taup'],
  }

  rsync::get { 'taup-csh':
    source  => "duplicon.nmt.edu::${::lsbdistcodename}-taup/taup.csh",
    path    => '/etc/csh/login.d/',
    times   => true,
    require => Rsync::Get['taup'],
  }

}
