# class profiles::nmt::passw

class profiles::nmt::passwd {

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
