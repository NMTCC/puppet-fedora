# Configure postfix
class profile::postfix {

  package { 'postfix': }

  File {
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['postfix'],
  }

  file { '/etc/mailname':
    content => "${::fqdn}\n",
  }

  file { '/etc/postfix/main.cf':
    content => template('profile/main.cf.erb'),
  }

  $mail = "mailer-daemon: postmaster\npostmaster: root"
  $sec = "abuse: root\nnobody: root\nsecurity: root"
  $net = "hostmaster: root\nnoc: root"
  $news = "usenet: root\nnews: root"
  $web = "webmaster: root\nwww: root"
  $svc = "ftp: root\nclamav: root"

  file { '/etc/aliases':
    content =>
      "${mail}\n${sec}\n${net}\n${news}\n${web}\n${svc}\nroot: itc-eng@nmt.edu\n",
  }

  exec { 'newaliases':
    command     => 'newaliases',
    subscribe   => File['/etc/aliases'],
    refreshonly => true,
  }

  unless $::chroot {

    service { 'postfix':
      ensure    => running,
      enable    => true,
      subscribe => File['/etc/postfix/main.cf'],
    }

  }

}
