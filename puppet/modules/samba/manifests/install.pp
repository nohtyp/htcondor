class samba::install inherits samba {
  
  package { $packages:
    ensure =>  installed,
  }
}
