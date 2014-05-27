# class profiles::iris
#
# Defines resources needed for IRIS Intern Orientation

class profiles::iris {

  package { 'perl-Moose':
    ensure   => installed,
    provider => 'yum',
  }


  # Rsync CWPSU
  rsync::get { '/usr/local/cwp':
    path   => '/usr/local/',
    source => 'update.nmt.edu::CWP/cwpsu',
  }

  #Rsync CWPSU profiles
  rsync::get { '/etc/profile.d/cwpsu.sh':
    source => 'update.nmt.edu::CWP/cwpsu.sh',
  }
  rsync::get { '/etc/profile.d/cwpsu.csh':
    source => 'update.nmt.edu::CWP/cwpsu.csh',
  }


  # Rsync IRIS Scripts
  rsync::get { '/usr/local/sh':
    path   => '/usr/local/',
    source => 'update.nmt.edu::IRIS/sh',
  }
  rsync::get { '/usr/local/pl':
    path   => '/usr/local/',
    source => 'update.nmt.edu::IRIS/pl',
  }

  #Rsync IRIS Script profiles
  rsync::get { '/etc/profile.d/iris.sh':
    source => 'update.nmt.edu::IRIS/iris.sh',
  }
  rsync::get { '/etc/profile.d/iris.csh':
    source => 'update.nmt.edu::IRIS/iris.csh',
  }


}
