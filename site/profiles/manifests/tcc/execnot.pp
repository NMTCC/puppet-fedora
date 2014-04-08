define profiles::tcc::execnot ($command = $title, $timeout = 300, $onlyifnot) {
	exec { $title :
		command => $command,
		onlyif => "${onlyifnot} ; case $? in 0) exit 1;; *) exit 0;; esac",
		timeout => $timeout,
	}
}
