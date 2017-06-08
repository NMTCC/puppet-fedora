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

  $rmlist = [
    '/etc/profile.d/iris-sh',
    '/etc/profile.d/iris-csh',
    '/etc/profile.d/sac-sh',
    '/etc/profile.d/sac-csh',
    '/usr/local/pl',
  ]

  $rmdirlist = [
    '/usr/local/cwp-44r5',
    '/usr/local/oss-2.03',
    '/usr/local/xmax-2.0.7',
    '/usr/local/sac',
  ]

  file { $rmlist: ensure => absent, }

  exec { $rmdirlist:
    path => '/bin:/usr/bin/',
    command => "rm -rf $title",
    onlyif => "test -e $title",
  }

/*

  case $::hostname {

    /^speare5/: {

      package { $perl: provider => 'apt', ensure => 'installed', }

      file { '/usr/local/pl':
        ensure => 'link',
        target => '/fs/scratch/iris2017/SHARED/pl',
      }

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

      rsync::get { 'iris-bashrc':
        source  => 'duplicon.nmt.edu::Jessie-iris/iris.bashrc',
        path    => '/etc/bash.bashrc',
        times   => true,
        require => Rsync::Get['iris-sh'],
      }

      rsync::get { 'iris-cshrc':
        source  => 'duplicon.nmt.edu::Jessie-iris/iris.cshrc',
        path    => '/etc/csh.cshrc',
        times   => true,
        require => Rsync::Get['iris-csh'],
      }

    }
    default: {
      warning('No IRIS configuration for this workstation.')
    }

  }

*/

}
