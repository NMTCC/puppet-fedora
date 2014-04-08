# class profiles::tcc::autofs

class profiles::tcc::autofs {

	$dest = "/etc"
	$scripts = ['fs', 'sf', 'home']
	
	$moduleloc = "puppet:///modules/profiles/${operatingsystem}/autofs/${operatingsystemrelease}"

	File { owner => 'root', group => 'root', }
	define fsfile ($ext = $title, $mode) {
	  file { "${profiles::tcc::autofs::dest}/auto.${ext}":
	    ensure => 'file',
	    source => "${profiles::tcc::autofs::moduleloc}/auto.${ext}", 
	    mode => $mode,
	  }
  }
  
	fsfile { $scripts : mode => '0755', }
	fsfile { 'master': mode => '0644', }

	define rootdir ($dir = $title) { file { "/${dir}" : ensure => 'directory', mode => '0755', } }
	rootdir { $scripts : }

	service { 'autofs': require => [ Fsfile[$scripts], Fsfile['master'], Rootdir[$scripts] ], }

}
