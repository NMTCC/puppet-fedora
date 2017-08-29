node 'rainbow.nmt.edu' {

  include "role::${::lsbdistcodename}"
  include role::loginserver

}
