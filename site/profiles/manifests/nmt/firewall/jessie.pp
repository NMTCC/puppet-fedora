# class profiles::nmt::firewall::jessie

class profiles::nmt::firewall::jessie {

  firewalldopen { '4373/tcp': zone => 'public', }
  firewalldopen { '51413/tcp': zone => 'public', }

}
