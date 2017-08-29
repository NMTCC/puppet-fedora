node 'login.nmt.edu' {

  include "role::${::lsbdistcodename}"
  include role::loginserver

}
