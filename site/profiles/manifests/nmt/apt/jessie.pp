# class profiles::nmt::apt::jessie

class profiles::nmt::apt::jessie {

  aptkeyfromweb { 'google-linux':
    uri => 'https://dl.google.com/linux/linux_signing_key.pub',
  }

  aptsource { 'google-chrome':
    type => 'deb',
    uri => 'http://dl.google.com/linux/chrome/deb/',
    suite => 'stable',
    comp => ['main'],
  }

}
