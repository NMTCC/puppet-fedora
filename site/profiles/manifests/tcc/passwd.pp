# class profiles::tcc::passw

class profiles::tcc::passwd {

  user { 'root':
    ensure   => 'present',
    name     => 'root',
    password => hiera('rootpasswd'),
    system   => true,
  }

  user { 'tccgrub':
    ensure   => 'present',
    name     => 'tccgrub',
    password => hiera('grubpasswd'),
    system   => true,
  }

}
