class samba::sambacron inherits samba {
  cron { 'AD verify':
    ensure  => present,
    command => "/usr/bin/wbinfo -u > /tmp/adjoined 2> /dev/null",
    require => [ File['adjoined file'], Exec['authconfig']],
    user    => root,
    minute  => '*/2',
  }
}
