class profiles::nmt::rsync::jessie::phono3py {

  rsync::get { 'phono3py':
    source => 'duplicon.nmt.edu::Jessie-phono3py/phono3py-1.10.10',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

}
