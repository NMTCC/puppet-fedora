define profiles::nmt::execlnwrong ($command = $title, $ln, $target) {
	exec { $title : 
		command => $command,
		onlyif => "/bin/[ ! -h ${ln} -o \"`readlink ${ln}`\" != \"${target}\" ]",
	}
}		
