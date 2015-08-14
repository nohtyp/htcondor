class samba::keytab inherits samba {
  exec { 'Create keytab file':
    path    => '/bin:/usr/bin',
    command => "net ads keytab create -U $join_user%$join_user_pw",
    unless  => "grep $join_user /tmp/adjoined",
  }
}
