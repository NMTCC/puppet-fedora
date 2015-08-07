class profiles::nmt::rsync::jessie::vmd {

  rsync::get { 'vmd':
    source    => 'duplicon.nmt.edu::Jessie-vmd/lib/vmd',
    path      => '/usr/local/lib/',
    recursive => true,
    links     => true,
    times     => true,
  }

  rsync::get { 'vmd-bin':
    source  => 'duplicon.nmt.edu::Jessie-vmd/vmd',
    path    => '/usr/local/bin/',
    times   => true,
    require => Rsync::Get['vmd'],
  }

}
