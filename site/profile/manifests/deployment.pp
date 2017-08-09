# Configure template deployment
class profile::deployment {

  include "profile::deployment::${::lsbdistcodename}"

}
