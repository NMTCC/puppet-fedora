# class profiles::nmt::passw

class profiles::nmt::passwd {

  user { 'root':
    ensure   => 'present',
    name     => 'root',
    password => hiera('rootpasswd'),
    system   => true,
  }

  user { 'nmtgrub':
    ensure => 'absent',
    name   => 'nmtgrub',
  }

  user { 'nmtgrubitc':
    ensure   => 'present',
    name     => 'nmtgrubitc',
    password => hiera('grubpasswd'),
    system   => true,
  }

  user { 'nmtgrubact':
    ensure   => 'present',
    name     => 'nmtgrubact',
    password => hiera('actgrubpasswd'),
    system   => true,
  }

}
