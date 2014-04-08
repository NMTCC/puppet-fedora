# class roles::puppet

class roles::puppet {

  include profiles::puppet
  include profiles::couchdb

}
