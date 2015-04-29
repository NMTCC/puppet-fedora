# class profiles::nmt::autofs

class profiles::nmt::autofs {

  case $::operatingsystem {
    'Fedora': {
      $masterdir = '/etc'
      $master = 'auto.master'
      $scriptdir = '/etc'
      $scripts = ['fs', 'sf', 'home']
    }
    'Debian': {
      $masterdir = '/etc/auto.master.d'
      $master = 'nmt.autofs'
      $scriptdir = '/usr/local/libexec'
      $scripts = ['fs', 'home']
    }
  }

  $moduleloc = "puppet:///modules/profiles/${operatingsystem}/autofs/${operatingsystemmajrelease}"

  File { owner => 'root', group => 'root', }
  define fsfile ($ext = $title, $mode) {
    file { "${profiles::nmt::autofs::scriptdir}/auto.${ext}":
      ensure => 'file',
      source => "${profiles::nmt::autofs::moduleloc}/auto.${ext}", 
      mode   => $mode,
    }
  }
  define mfile ($mode) {
    file { "${profiles::nmt::autofs::masterdir}/${title}":
      ensure => 'file',
      source => "${profiles::nmt::autofs::moduleloc}/${title}", 
      mode   => $mode,
    }
  }

  mfile { $master : mode => '0644', }
  fsfile { $scripts : mode => '0755', }

  define rootdir ($dir = $title) { file { "/${dir}" : ensure => 'directory', mode => '0755', } }
  rootdir { $scripts : }

  service { 'autofs': require => [ Fsfile[$scripts], Mfile[$master], Rootdir[$scripts] ], }

}
