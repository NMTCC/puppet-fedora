# rsync phono3py
class profile::rsync::phono3py {

  rsync::get { 'phono3py':
    source    => "duplicon.nmt.edu::${::lsbdistcodename}-phono3py/phono3py-1.11.9",
    path      => '/usr/local/',
    recursive => true,
    links     => true,
    times     => true,
  }

}
