class samba::filecreate inherits samba {
  file { 'adjoined file':
    ensure  => file,
    path    => '/tmp/adjoined',
  }
}
