class samba::config inherits samba {

  file_line { 'AD samba kerberos secrets and keytab':
    path   => '/etc/samba/smb.conf',
    match  => '   kerberos\smethod\s\=\ssecrets\D+',
    line   => '   kerberos method = secrets and keytab',
  }
  
  file_line { 'AD samba kerberos refresh tickets':
    path   => '/etc/samba/smb.conf',
    after  => '   winbind offline logon = false',
    line   => '   winbind refresh tickets = yes',
  }

}
