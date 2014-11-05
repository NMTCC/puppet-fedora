# Defines the TCC package lists
class profiles::tcc::yum::packages {

  case $::operatingsystemrelease {
    '19': {
      $packlist = [
        'a2ps',
        'abiword',
        'ack',
        'alpine',
        'alsamixergui',
        'apcupsd',
        'aria2',
        'audacious',
        'audacious-plugins-freeworld',
        'audacity-freeworld',
        'autofs',
        'awesome',
        'banner',
        'bison',
        'blackbox',
        'blender',
        'bluefish',
        'bpython',
        'byacc',
        'bzr',
        'cabal-install',
        'calligra-krita',
        'cinnamon',
        'clang-devel',
        'claws-mail',
        'claws-mail-plugins',
        'clearlooks-compact-gnome-theme',
        'clisp',
        'compat-gcc-34-g77',
        'ConsoleKit-x11',
        'cryptkeeper',
        'dconf-editor',
        'dejavu-sans-mono-fonts',
        'dejavu-serif-fonts',
        'dia',
        'dialog',
        'emacs-docbook-rng',
        'erlang',
        'expect',
        'ez-pine-gpg',
        'feh',
        'festival',
        'fftw',
        'fish',
        'flash-plugin',
        'flex',
        'fluxbox',
        'fortune-mod',
        'fpc',
        'freeglut-devel',
        'fuse-sshfs',
        'fvwm',
        'gcc-gnat',
        'gconf-editor',
        'geeqie',
        'gftp',
        'ghc-ghc-devel',
        'ghex',
        'gimp-resynthesizer',
        'git-all',
        'glibc-devel',
        'GMT',
        'gnome-theme-curvylooks',
        'gnome-tweak-tool',
        'gnugo',
        'google-chrome-stable',
        'gpgme-devel',
        'grace',
        'graphviz',
        'grip',
        'gsl-devel',
        'gtk+',
        'gtkterm',
        'gtk-xfce-engine',
        'haskell-platform',
        'htop',
        'hexchat',
        'icewm-xdgmenu',
        'imake',
        'inkscape',
        'irssi',
        'iscan-data',
        'iscan-plugin-gt-x750',
        'k3b-extras-freeworld',
        'kdenlive',
        'kdiff3',
        'keychain',
        'kernel',
        'krb5-workstation',
        'lame',
        'lapack',
        'latex2html',
        'latex2rtf',
        'ldapvi',
        'lesstif',
        'libbsd-devel',
        'libgcc',
        'libglade',
        'libmatekbd',
        'libmatekeyring',
        'libmatenotify',
        'libmateweather',
        'libmatewnck',
        'libreoffice',
        'libtorrent-devel',
        'libXp',
        'linuxdoc-tools',
        'livecd-tools',
        'lm_sensors',
        'lohit-kannada-fonts',
        'lynx',
        'mate-backgrounds',
        'mate-calc',
        'mate-file-archiver',
        'mate-file-manager',
        'mate-file-manager-open-terminal',
        'mate-icon-theme',
        'mate-image-viewer',
        'mate-keyring-pam',
        'mate-media',
        'mate-menus',
        'mate-netspeed',
        'mate-notification-daemon',
        'mate-power-manager',
        'mate-session-manager',
        'mate-settings-daemon',
        'mate-system-log',
        'mate-system-monitor',
        'mate-terminal',
        'mate-text-editor',
        'mate-themes',
        'mate-utils',
        'mate-window-manager',
        'mc',
        'meld',
        'mercurial',
        'mjpegtools',
        'mono-devel',
        'mousepad',
        'mutt',
        'MySQL-python',
        'nasm',
        'nautilus-open-terminal',
        'ncl-devel',
        'net-snmp',
        'netbeans-platform',
        'nethack',
        'netpbm-progs',
        'nmap',
        'ntp',
        'octave-signal',
        'openldap-clients',
        'oracle-instantclient12.1-precomp',
        'oracle-instantclient12.1-sqlplus',
        'pam_krb5',
        'pandoc',
        'paraview',
        'pax',
        'parole',
        'pbzip2',
        'pdfchain',
        'pdfshuffler',
        'perl-Any-Moose',
        'perl-LDAP',
        'perl-Text-Markdown',
        'pidgin',
        'postgresql',
        'puppet',
        'pv',
        'pyOpenSSL',
        'python-4Suite-XML',
        'python-BeautifulSoup',
        'python-beautifulsoup4',
        'python-EnthoughtBase',
        'python-gdata',
        'python-ipython',
        'python-lxml',
        'python-markdown2',
        'python-matplotlib-tk',
        'python-matplotlib-wx',
        'python-mechanize',
        'python-pep8',
        'python-pexpect',
        'python-pillow-tk',
        'python-pmw',
        'python-psycopg2',
        'python-setproctitle',
        'python-sqlalchemy',
        'python-twisted',
        'python-virtualenv',
        'python3-devel',
        'python3-lxml',
        'python3-matplotlib-tk',
        'python3-tools',
        'R',
        'rb_libtorrent-python',
        'redhat-lsb',
        'remctl-perl',
        'remctl-python',
        'rssh',
        'rubygem-gtk2',
        'ruby-gnome2',
        'ruby-irb',
        'ruby-ldap',
        'rxvt-unicode',
        'scipy',
        'screen',
        'scribus',
        'seamonkey',
        'SFML-devel',
        'sharutils',
        'sl',
        'slrn',
        'sox',
        'spamassassin',
        'spice-xpi',
        'sssd-client.i686',
        'sssd-client.x86_64',
        'ssss',
        'strace',
        'system-switch-displaymanager',
        'tcc-perl-Quota',
        'tccmotd',
        'tcpdump',
        'texlive-epstopdf',
        'thunar-volman',
        'thunderbird-enigmail',
        'thunderbird-lightning',
        'tigervnc',
        'tigervnc-server',
        'tinyfugue',
        'tmux',
        'trang',
        'transmission-daemon',
        'udftools',
        'udpcast',
        'unrar',
        'vacation',
        'vim-X11',
        'vlc',
        'w3m-img',
        'WindowMaker',
        'wine',
        'wireshark-gnome',
        'wqy-zenhei-fonts',
        'xaos',
        'xchat',
        'xep',
        'xfce4-screenshooter-plugin',
        'xfce4-weather-plugin',
        'xfig',
        'xfwm4-themes',
        'xorg-x11-apps',
        'xorg-x11-xinit-session',
        'xpdf',
        'xscreensaver',
        'xscreensaver-extras',
        'xscreensaver-gl-extras',
        'xv',
        'yasm',
        'yum-utils',
        'zsh',
      ]
      $removelist = [
        'abrt-java-connector',
        'deja-dup',
        'kdesdk',
        'LPRng',
        'xine-lib-extras-freeworld',
      ]
    }
    default: {
      $packlist = []
      $removelist = []
    }
  }
  Package { ensure => 'installed', require => Exec['yum-makecache'], }
  package { $packlist : provider => 'yum', }
  package { $removelist : ensure => 'absent', provider => 'yum', }
}
