class profile::linuxad {
  include stdlib
  include samba
  include ssh
  #include resolv_conf
  #include cac
  #include sudo
  #include sudo::configs
}
