# Configure NetworkManager
class profile::networkmanager {

  $pklapath = '/etc/polkit-1/localauthority/50-local.d'
  $pklafile = 'org.nmt.NetworkManager.pkla'

  file { "${pklapath}/${pklafile}":
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  Ini_setting {
    ensure            => present,
    path              => "${pklapath}/${pklafile}",
    section           => 'Restrict NetworkManager',
    key_val_separator => '=',
    require           => File["${pklapath}/${pklafile}"],
  }

  ini_setting {

    'nm-identity':
      setting => 'Identity',
      value   => 'unix-user:*',;

    'nm-action':
      setting => 'Action',
      value   => 'org.freedesktop.NetworkManager.*',;

    'nm-resultactive':
      setting => 'ResultActive',
      value   => 'auth_admin_keep',;

    'nm-resultinactive':
      setting => 'ResultInactive',
      value   => 'no',;

    'nm-resultany':
      setting => 'ResultAny',
      value   => 'no',;

  }

}
