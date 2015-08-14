class cac::files inherits cac {

  file { $cacfile1:
    ensure   => present,
    path     => "/etc/pki/nssdb/$cacfile1",
    backup   => true,
    source   => "puppet:///modules/cac/$cacfile1",
    mode     => '0644',
    owner    => 'root',
    group    => 'root',
  }
  file { $cacfile2:
    ensure   => present,
    path     => "/etc/pki/nssdb/$cacfile2",
    backup   => true,
    source   => "puppet:///modules/cac/$cacfile2",
    mode     => '0644',
    owner    => 'root',
    group    => 'root',
  }
  file { $cacfile3:
    ensure   => present,
    path     => "/etc/pki/nssdb/$cacfile3",
    backup   => true,
    source   => "puppet:///modules/cac/$cacfile3",
    mode     => '0644',
    owner    => 'root',
    group    => 'root',
  }
  file { $cacfile4:
    ensure   => present,
    path     => "/etc/pki/nssdb/$cacfile4",
    backup   => true,
    source   => "puppet:///modules/cac/$cacfile4",
    mode     => '0644',
    owner    => 'root',
    group    => 'root',
  }
  file { $cacfile5:
    ensure   => present,
    path     => "/etc/pki/nssdb/$cacfile5",
    backup   => true,
    source   => "puppet:///modules/cac/$cacfile5",
    mode     => '0644',
    owner    => 'root',
    group    => 'root',
  }
  file { $cacfile6:
    ensure   => present,
    path     => "/etc/pki/nssdb/$cacfile6",
    backup   => true,
    source   => "puppet:///modules/cac/$cacfile6",
    mode     => '0644',
    owner    => 'root',
    group    => 'root',
  }
}

