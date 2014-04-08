# class profiles::sensu::plugins

class profiles::sensu::plugins {

  class { 'sensu':
    rabbitmq_port            => 5671,
    rabbitmq_password        => hiera(dbpasswd),
    rabbitmq_host            => 'mqhost.nmt.edu',
    subscriptions            => ['fedora',],
    repo_source              => 'http://repos.sensuapp.org/yum/el/6/$basearch/',
    rabbitmq_ssl_private_key => 'puppet:///files/sensu/ssl/key.pem',
    rabbitmq_ssl_cert_chain  => 'puppet:///files/sensu/ssl/cert.pem',
  }  

  vcsrepo { '/etc/sensu/plugins/sensu-community-plugins':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/sensu/sensu-community-plugins.git',
    revision => 'master',
#    user     => 'sensu',
  } ->

  vcsrepo { '/etc/sensu/plugins/sensu-tcc-plugins':
    ensure   => latest,
    provider => git,
    source   => 'https://github.com/NMTCC/sensu-tcc-plugins.git',
    revision => 'master',
#    user     => 'sensu',
  } ~>

# in case we ever go back to running as sensu we uncomment this
#  exec { 'sensu_permissions':
#    command => '/bin/chown -R sensu:sensu /etc/sensu',
#  } ->

# just runn the sensu-client service as root for now
  exec { 'sensu_user':
    refreshonly => true,
    command => '/bin/sed -i s/USER=sensu/USER=root/ /etc/init.d/sensu-service',
  }

# in case we ever go back to running as sensu we uncomment this
#  exec { 'sensu_plugin':
#    command => '/bin/chown sensu:sensu /opt/sensu && /bin/su sensu -s /bin/bash -l -c "gem install sensu-plugin"',
#  }

}
