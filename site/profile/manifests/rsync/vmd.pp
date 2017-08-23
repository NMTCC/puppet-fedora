# rsync VMD
class profile::rsync::vmd {

  # Visual Molecular Dynamics
  # Dr. Sally Pias
  # Requested 29 Jul 2016

  rsync::get { 'vmd':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-vmd/vmd",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
    schedule  => 'rsync',
  }

  file { '/usr/local/bin/vmd':
    ensure  => link,
    target  => '/usr/local/vmd/vmd',
    require => Rsync::Get['vmd'],
  }

}
