# class profiles::nmt::ooffice

class profiles::nmt::ooffice {

  define oolink ($flag) {
    file { "/usr/local/bin/${title}":
      ensure  => 'file',
      content => "#!/bin/sh\nexec libreoffice ${flag} \"$@\"",
      mode    => '0755',
    }
  }

  oolink { 'oocalc': flag => '--calc', }
  oolink { 'oodraw': flag => '--draw', }
  oolink { 'ooffice': flag => '', }
  oolink { 'ooimpress': flag => '--impress', }
  oolink { 'oomath': flag => '--math', }
  oolink { 'ooviewdoc': flag => '--view', }
  oolink { 'oowriter': flag => '--writer', }

}
