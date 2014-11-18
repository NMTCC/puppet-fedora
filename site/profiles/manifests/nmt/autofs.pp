# class profiles::nmt::autofs

class profiles::nmt::autofs {

	$dest = "/etc"
	$scripts = ['fs', 'sf', 'home']
	
	$moduleloc = "puppet:///modules/profiles/${operatingsystem}/autofs/${::operatingsystemmajrelease}"

	File { owner => 'root', group => 'root', }
	define fsfile ($ext = $title, $mode) {
	  file { "${profiles::nmt::autofs::dest}/auto.${ext}":
	    ensure => 'file',
	    source => "${profiles::nmt::autofs::moduleloc}/auto.${ext}", 
	    mode => $mode,
	  }
  }
  
	fsfile { $scripts : mode => '0755', }
	fsfile { 'master': mode => '0644', }

	define rootdir ($dir = $title) { file { "/${dir}" : ensure => 'directory', mode => '0755', } }
	rootdir { $scripts : }

	service { 'autofs': require => [ Fsfile[$scripts], Fsfile['master'], Rootdir[$scripts] ], }

}
