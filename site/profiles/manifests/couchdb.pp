# class profiles::couchdb

class profiles::couchdb {

  class { '::couchdb': }
  
  package { 'hiera-http':
    ensure   => 'installed',
    provider => 'gem',
  }
        


}
