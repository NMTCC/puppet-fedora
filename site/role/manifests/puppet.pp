# class role::puppet

class role::puppet {

  include profiles::puppet
  include profiles::couchdb

}
