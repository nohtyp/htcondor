class cac::config inherits cac {
 exec { 'Adding cac authentication to system':
   path    => '/usr/sbin:/bin:/usr/bin',
   command => "authconfig --enablesmartcard --update",
   unless  => "test -f /etc/dconf/db/distro.d/10-authconfig",
  }
}
 
