class profiles::nmt::localizations::jessie {

  $packlist = [
    'hunspell-an',
    'hunspell-ar',
    'hunspell-be',
    'hunspell-br',
    'hunspell-da',
    'hunspell-de-at',
    'hunspell-de-ch',
    'hunspell-de-de',
    'hunspell-en-ca',
    'hunspell-en-us',
    'hunspell-eu-es',
    'hunspell-fr',
    'hunspell-gl-es',
    'hunspell-hu',
    'hunspell-kk',
    'hunspell-ko',
    'hunspell-ml',
    'hunspell-ne',
    'hunspell-ro',
    'hunspell-ru',
    'hunspell-se',
    'hunspell-sh',
    'hunspell-sr',
    'hunspell-sv-se',
    'hunspell-uz',
    'hunspell-vi',
  ]

  $removelist = []

  Package { ensure => 'installed', require => Exec['apt-update'], }
  package { $packlist : provider => 'apt', }
  package { $removelist : provider => 'apt', ensure => 'absent', }

}
