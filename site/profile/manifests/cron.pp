# Configure crons
class profile::cron {

  class { 'cron':
    manage_service => false,
  }

  cron::job::multiple { 'nmt-crons':
    jobs        => [
      {
        minute      => '15',
        hour        => '00',
        date        => '*',
        month       => '*',
        weekday     => '*',
        user        => 'root',
        command     => '/bin/true',
#          '/usr/local/libexec/reboot_to_win >> /var/log/nightlyreboots.log',
        description => 'Linux nightly reboot',
      },
      {
        minute      => '45',
        hour        => '06',
        date        => '*',
        month       => '*',
        weekday     => '*',
        user        => 'root',
        command     => '/bin/true',
#          '/usr/local/libexec/random_machine_reboot >> /var/log/nightlyreboots.log',
        description => 'Opening target OS nightly reboot',
      },
      {
        minute      => '59',
        hour        => '23',
        date        => '*',
        month       => '*',
        weekday     => '*',
        user        => 'root',
        command     => '/usr/local/libexec/mail_sudo_logs',
        description => 'Bad sudoers notification',
      },
      {
        minute      => '01',
        hour        => '*',
        date        => '*',
        month       => '*',
        weekday     => '*',
        user        => 'root',
        command     => '/usr/local/bin/grub2',
        description => 'GRUB conf updater',
      },
    ],
    environment => [
      'SHELL=/bin/bash',
      'PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      'MAILTO=root',
      'HOME=/',
    ],
  }

}
