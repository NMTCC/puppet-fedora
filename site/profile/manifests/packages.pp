# Install packages
class profile::packages {

  $packlist = hiera('packlist')
  $removelist = hiera('removelist')
  $holdlist = hiera('holdlist')
  $backportlist = hiera('backportlist')
  $nochroot = hiera('nochroot')

  Package {
    ensure   => installed,
    provider => 'apt',
  }

  package { $packlist: }

  package { $removelist:
    ensure => absent,
  }

  package { $holdlist:
    ensure => held,
  }

  if $backportlist {
    package { $backportlist:
      install_options => {
        '-t' => "${::lsbdistcodename}-backports",
      },
    }
  }

  unless $::chroot {
    package { $nochroot: }
  }

  Package['s-nail'] -> Package['bsd-mailx']

}
