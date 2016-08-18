# Class profiles::nmt::remctl
#
# Configures the remctl commands common to all TCC Fedora client stations
# Currently, this is 'puppetagent'
class profiles::nmt::remctl {

  remctl::command { 'puppetagent':
    commands        => [
      {
        'command'    => 'puppet',
        'subcommand' => 'agent',
        'executable' => '/usr/local/bin/puppetagent',
        'acl'        => '/etc/remctl/acl/puppetagent',
      },
    ],
  }

  remctl::acl { 'puppetagent':
    principals => [
      'remctl/neptr.nmt.edu@NMT.EDU',
    ],
  }

  file { '/usr/local/bin/puppetagent':
    ensure  => 'file',
    content => "#!/bin/bash\n/usr/bin/puppet agent --color false $*\n",
    group   => 'root',
    mode    => '0750',
    owner   => 'root',
  }

  remctl::command { 'remreboot':
    commands        => [
      {
        'command'    => 'remreboot',
        'subcommand' => 'ALL',
        'executable' => '/usr/local/bin/remreboot',
        'acl'        => '/etc/remctl/acl/remreboot',
      },
    ],
  }

  remctl::acl { 'remreboot':
    principals => [
      'remctl/neptr.nmt.edu@NMT.EDU',
    ],
  }

  remctl::command { 'xorguser':
    commands        => [
      {
        'command'    => 'xorguser',
        'subcommand' => 'ALL',
        'executable' => '/usr/local/bin/xorg_user',
        'acl'        => '/etc/remctl/acl/xorguser',
      },
    ],
  }

  remctl::acl { 'xorguser':
    principals => [
      'remctl/neptr.nmt.edu@NMT.EDU',
    ],
  }

  remctl::command { 'rrapp':
    commands => [
      {
        'command'    => 'rrapp',
        'subcommand' => 'ALL',
        'executable' => '/usr/local/bin/rrapp',
        'acl'        => '/etc/remctl/acl/rrapp',
      },
    ],
  }

  remctl::acl { 'rrapp':
    principals => [
      'dgraham@NMT.EDU',
      'jluster@NMT.EDU',
      'turnerb@NMT.EDU',
      'chip@NMT.EDU',
      'cj@NMT.EDU',
      'milagrec@NMT.EDU',
      'travis@NMT.EDU',
    ],
  }

  remctl::command { 'cupholder':
    commands        => [
      {
        'command'    => 'cupholder',
        'subcommand' => 'ALL',
        'executable' => '/usr/local/bin/cup_holder',
        'acl'        => '/etc/remctl/acl/cupholder',
      },
    ],
  }

  remctl::acl { 'cupholder':
    principals => [
      'remctl/neptr.nmt.edu@NMT.EDU',
    ],
  }

  file { '/usr/local/bin/cup_holder':
    ensure  => 'file',
    content => "#!/bin/bash\n\n/usr/bin/eject -T 2>&1\n",
    group   => 'root',
    mode    => '0750',
    owner   => 'root',
  }

}
