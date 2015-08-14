class samba::service inherits samba {
  service { $samba_services:
    ensure      => 'running',
    enable      => true,
    hasstatus   => true,
    hasrestart  => true,
    subscribe   => [ File_line['AD samba kerberos secrets and keytab'], File_line['AD samba kerberos refresh tickets']],
  }
}
