class cac::users inherits cac {
  file { 'Link user to CAC':
    ensure  => file,
    path    => '/etc/pam_pkcs11/cn_map',
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    content => template('cac/cn_map.erb'), 
  }
}
