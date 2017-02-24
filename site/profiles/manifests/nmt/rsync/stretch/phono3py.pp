class profiles::nmt::rsync::stretch::phono3py {

  rsync::get { 'phono3py':
    source => 'duplicon.nmt.edu::Jessie-phono3py/phono3py-1.11.9',
    path => '/usr/local/',
    recursive => true,
    links => true,
    times => true,
  }

}
