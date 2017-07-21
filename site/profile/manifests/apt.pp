# Configure apt
class profile::apt {

  package { 'apt-transport-https': }

  class { 'apt':
    purge  => {
      'sources.list'   => true,
      'sources.list.d' => true,
      'preferences'    => true,
      'preferences.d'  => true,
    },
    update => {
      frequency => 'daily',
    },
  }

  # import keys
  apt::key { 'google-linux':
    id     => '4CCA1EAF950CEE4AB83976DCA040830F7FAC5991',
    server => 'pgp.mit.edu',
    source => 'https://dl.google.com/linux/linux_signing_key.pub',
  }

  apt::key { 'puppet':
    id     => '6F6B15509CF8E59E6E469F327F438280EF8D349F',
    server => 'pgp.mit.edu',
    source => 'https://apt.puppet.com/pubkey.gpg',
  }

  apt::key { 'nmt':
    id     => '6B9BE830DEB754D51DA1EF5D9A316557DA217D04',
    server => 'pgp.mit.edu',
    source => 'http://duplicon.nmt.edu/nmt/nmt.gpg.key',
  }

  apt::key { 'obspy':
    id     => 'AB88DF222C40D448E99F0F07054D40E834811F05',
    server => 'pgp.mit.edu',
    source =>
      'https://raw.githubusercontent.com/obspy/obspy/master/misc/debian/public.key',
  }

  # third party repos
  apt::source { 'google-chrome':
    location => 'http://dl.google.com/linux/chrome/deb/',
    release  => 'stable',
    repos    => 'main',
    include  => {
      'deb' => true,
    },
    require  => Apt_key['google-linux'],
  }

# Puppet is still signing with SHA1
# https://tickets.puppetlabs.com/browse/CPR-390
#  apt::source { 'puppet':
#    location => 'https://apt.puppet.com/',
#    release  => $::lsbdistcodename,
#    repos    => 'main dependencies',
#    include  => {
#      'deb' => true,
#    },
#    require  => [
#      Apt_key['puppet'],
#      Package['apt-transport-https'],
#    ],
#  }

  apt::source { 'nmt':
    location => 'http://duplicon.nmt.edu/nmt/debian/',
    release  => $::lsbdistcodename,
    repos    => 'main',
    include  => {
      'deb' => true,
    },
    require  => Apt_key['nmt'],
  }

# 20170719 - ObsPy has no stretch builds available
#  apt::source { 'obspy':
#    location => 'http://deb.obspy.org/',
#    release  => $::lsbdistcodename,
#    repos    => 'main',
#    include  => {
#      'deb' => true,
#    },
#    require  => Apt_key['obspy'],
#  }

  # standard repos
  apt::source { $::lsbdistcodename:
    location => 'http://duplicon.nmt.edu/debian/',
    release  => $::lsbdistcodename,
    repos    => 'main non-free contrib',
    include  => {
      'deb' => true,
    },
  }

  apt::source { "${::lsbdistcodename}-backports":
    location => 'http://duplicon.nmt.edu/debian/',
    release  => "${::lsbdistcodename}-backports",
    repos    => 'main non-free contrib',
    include  => {
      'deb' => true,
    },
  }

  apt::source { "${::lsbdistcodename}-security":
    location => 'http://duplicon.nmt.edu/debian-security/',
    release  => "${::lsbdistcodename}/updates",
    repos    => 'main non-free contrib',
    include  => {
      'deb' => true,
    },
  }

  apt::source { "${::lsbdistcodename}-updates":
    location => 'http://duplicon.nmt.edu/debian/',
    release  => "${::lsbdistcodename}-updates",
    repos    => 'main non-free contrib',
    include  => {
      'deb' => true,
    },
  }

}
