# class profiles::nmt::firewall::jessie

class profiles::nmt::firewall::jessie {

  if $::chroot {
    warning('Skipping firewalld because we are chrooted.')
  }
  else {
    firewalldopen { '4373/tcp': zone => 'public', }
    firewalldopen { '51413/tcp': zone => 'public', }
  }

}
