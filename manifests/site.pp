Exec { path => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin', }
File { backup => false, }

node default {

  include "role::${::lsbdistcodename}"
  include role::graphical

}
