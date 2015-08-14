class samba::join inherits samba {

  exec { 'Join active directory':
   path    => '/bin:/usr/bin',
   command => "net ads join $mydomain -U $join_user%$join_user_pw createcomputer=$ou",
   unless  => "grep $join_user /tmp/adjoined",
  }
}
