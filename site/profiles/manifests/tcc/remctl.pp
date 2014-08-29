# Class profiles::remctl
#
# Configures the remctl commands common to all TCC Fedora client stations
# Currently, this is 'puppetagent'
class profiles::tcc::remctl {

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

}
