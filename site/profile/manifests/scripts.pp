# Install local scripts
class profile::scripts {

  File {
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => File['/usr/local/libexec'],
  }

  $moduleloc =
    "puppet:///modules/profile/${::operatingsystem}/${::operatingsystemmajrelease}"

  # /usr/local/bin
  file { '/usr/local/bin/chsh':
    source => "${moduleloc}/chsh",
  }
  file { '/usr/local/bin/clear_browser_locks':
    source => "${moduleloc}/clear_browser_locks",
  }
  file { '/usr/local/bin/finger-names':
    source => "${moduleloc}/finger-names",
  }
  file { '/usr/local/bin/reapply':
    source => "${moduleloc}/reapply",
  }
  file { '/usr/local/bin/reseed':
    source => "${moduleloc}/reseed",
  }
  file { '/usr/local/bin/reset_linux':
    source => "${moduleloc}/reset_linux",
  }
  file { '/usr/local/bin/reset_windows':
    source => "${moduleloc}/reset_windows",
  }
  file { '/usr/local/bin/set_next_os':
    source => "${moduleloc}/set_next_os",
  }
  file { '/usr/local/bin/sfdisk2parted':
    source => "${moduleloc}/sfdisk2parted",
  }

  $line1 = 'To change your password, please visit https://tcc.nmt.edu/password/.'
  $line2 = 'Log in with your NMT account, and follow the password rules.'
  file { '/usr/local/bin/passwd':
    content => "#!/bin/sh\nprintf \"${line1}\\n\"\nprintf \"${line2}\\n\"\n",
  }

  # /usr/local/libexec
  file { '/usr/local/libexec/kick_old_x_session':
    source => "${moduleloc}/kick_old_x_session",
  }
  file { '/usr/local/libexec/mail_sudo_logs':
    source => "${moduleloc}/mail_sudo_logs",
  }
  file { '/usr/local/libexec/pupdate':
    source => "${moduleloc}/pupdate",
  }
  file { '/usr/local/libexec/random_machine_reboot':
    source => "${moduleloc}/random_machine_reboot",
  }
  file { '/usr/local/libexec/reboot_to_win':
    source => "${moduleloc}/reboot_to_win",
  }
  file { '/usr/local/libexec/remote_reapply':
    source => "${moduleloc}/remote_reapply",
  }
  file { '/usr/local/libexec/remreboot':
    source => "${moduleloc}/remreboot",
  }
  file { '/usr/local/libexec/rrapp':
    source => "${moduleloc}/rrapp",
  }
  file { '/usr/local/libexec/xorg_user':
    source => "${moduleloc}/xorg_user",
  }

}
