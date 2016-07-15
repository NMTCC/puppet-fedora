# class profiles::nmt::apt::jessie

class profiles::nmt::apt::jessie {

  aptkeyfromweb { 'google-linux':
    uri => 'https://dl.google.com/linux/linux_signing_key.pub',
  }

  aptkeyfromweb { 'puppetlabs':
    uri => 'https://apt.puppetlabs.com/pubkey.gpg',
  }

  aptkeyfromweb { 'nmtkey':
    uri => 'http://duplicon.nmt.edu/nmt/nmt.gpg.key',
  }

  aptkeyfromweb { 'obspy':
    uri => 'https://raw.github.com/obspy/obspy/master/misc/debian/public.key',
  }

  aptsource { 'google-chrome':
    type    => 'deb',
    uri     => 'http://dl.google.com/linux/chrome/deb/',
    suite   => 'stable',
    comp    => ['main'],
    require => Aptkeyfromweb['google-linux'],
  }

  aptsource { 'puppet-labs':
    type    => 'deb',
    uri     => 'https://apt.puppetlabs.com/',
    suite   => 'jessie',
    comp    => ['main', 'dependencies'],
    require => Aptkeyfromweb['puppetlabs'],
  }

  aptsource { 'nmt-debian':
    type    => 'deb',
    uri     => 'http://duplicon.nmt.edu/nmt/debian/',
    suite   => 'jessie',
    comp    => ['main'],
    require => Aptkeyfromweb['nmtkey'],
  }

  aptsource { 'obspy':
    type    => 'deb',
    uri     => 'http://deb.obspy.org',
    suite   => 'jessie',
    comp    => ['main'],
    require => Aptkeyfromweb['obspy'],
  }

}
