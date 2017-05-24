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

      rsync::get { 'cwp-44r5':
        source => 'duplicon.nmt.edu::Jessie-iris/cwp-44r5',
        path => '/usr/local/',
        recursive => true,
        links => true,
        times => true,
      }

      rsync::get { 'oss-2.03':
        source => 'duplicon.nmt.edu::Jessie-iris/oss-2.03',
        path => '/usr/local/',
        recursive => true,
        links => true,
        times => true,
      }

      rsync::get { 'xmax-2.0.7':
        source    => 'duplicon.nmt.edu::Jessie-iris/xmax-2.0.7',
        path      => '/usr/local/',
        recursive => true,
        links     => true,
        times     => true,
      }

      rsync::get { 'sac':
        source    => 'duplicon.nmt.edu::Jessie-iris/sac-101.6a',
        path      => '/usr/local/',
        recursive => true,
        links     => true,
        times     => true,
      }

      rsync::get { 'iris-sh':
        source => 'duplicon.nmt.edu::Jessie-iris/iris.sh',
        path => '/etc/profile.d/',
        times => true,
        require => [ Rsync::Get['cwp-44r5'], Rsync::Get['oss-2.03'] ],
      }

      rsync::get { 'iris-csh':
        source => 'duplicon.nmt.edu::Jessie-iris/iris.csh',
        path => '/etc/profile.d/',
        times => true,
        require => [ Rsync::Get['cwp-44r5'], Rsync::Get['oss-2.03'] ],
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
