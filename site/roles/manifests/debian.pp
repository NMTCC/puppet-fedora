# class roles::debian

class roles::debian {

  $hour = generate("/usr/local/bin/puppethour")

  include profiles::nmt
  include profiles::nmt::autofs
  include profiles::nmt::config
  include profiles::nmt::ldap
  include profiles::nmt::localizations
  include profiles::nmt::localtime
  include profiles::nmt::ooffice
  include profiles::nmt::packages
  include profiles::nmt::passwd
  include profiles::nmt::postfix
  include profiles::nmt::remctl
  include profiles::nmt::firewall
  include profiles::nmt::loginsrv
  include profiles::nrao
  include profiles::iris

  if $::chroot {
    warning('Skipping torrent management because we are chrooted.')
  }
  else {
    if $::stringify { include profiles::nmt::deployment }
  }

  if ($hour == '04') or $::chroot {
    include profiles::nmt::apt
    Class[profiles::nmt::apt] -> Class[profiles::nmt] -> Class[profiles::nmt::packages] -> Class[profiles::nmt::localizations]
  }

  if ($hour == '03') or ($hour == '04') or ($hour == '05') or $::chroot {
    include profiles::nmt::rsync
  }

  # this because we run before d-i cleans up
  Package { allowcdrom => true, }

}
