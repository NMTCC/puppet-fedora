# class profiles::tcc::passw

class profiles::tcc::passwd {

  user { 'root':
    ensure   => 'present',
    name     => 'root',
    password => hiera('rootpasswd'),
    system   => true,
  }

  user { 'nmtgrub':
    ensure   => 'present',
    name     => 'nmtgrub',
    password => hiera('grubpasswd'),
    system   => true,
  }

}
