# class profiles::iris
#
# Defines resources needed for IRIS Intern Orientation

class profiles::iris {

  $perl = [
    'libconfig-simple-perl',
    'libshell-perl',
    'libmoose-perl',
    'perl-tk',
  ]

  case $::hostname {

    /^speare5/: {

      package { $perl: provider => 'apt', ensure => 'installed', }

      rsync::get { 'sac':
        source    => 'duplicon.nmt.edu::Jessie-iris/sac-101.6a',
        path      => '/usr/local/',
        recursive => true,
        links     => true,
        times     => true,
      }

      rsync::get { 'sac-sh':
        source  => 'duplicon.nmt.edu::Jessie-iris/sac.sh',
        path    => '/etc/profile.d/',
        times   => true,
        require => Rsync::Get['sac'],
      }

      rsync::get { 'sac-csh':
        source  => 'duplicon.nmt.edu::Jessie-iris/sac.csh',
        path    => '/etc/profile.d/',
        times   => true,
        require => Rsync::Get['sac'],
      }

    }
    default: {
      warning('No IRIS configuration for this workstation.')
    }

  }

}
