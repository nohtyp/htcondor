class samba::gpgkeys inherits samba {
  
  file { 'GPG Directory':
    path    => '/root/gpgkeys',
    ensure  => directory,
  }

  file { '/root/gpgkeys/RPM-GPG-KEY-CentOS-7':
    ensure  => file,
    require => File['GPG Directory'],
    source  => [
       'puppet:///modules/samba/RPM-GPG-KEY-CentOS-7',
      ]
    }

  file { '/root/gpgkeys/RPM-GPG-KEY-EPEL-7':
     ensure  => file,
     require => File['GPG Directory'],
     source  => [
       'puppet:///modules/samba/RPM-GPG-KEY-EPEL-7',
      ]
    }

  file { '/root/gpgkeys/RPM-GPG-KEY-puppetlabs':
     ensure  => file,
     require => File['GPG Directory'],
     source  => [
       'puppet:///modules/samba/RPM-GPG-KEY-puppetlabs',
      ]
    }

  exec { 'import gpgkeys':
    path       =>  '/usr/bin',
    command    => "rpm --import /root/gpgkeys/RPM-GPG-KEY-*",
    require    => [ File['/root/gpgkeys/RPM-GPG-KEY-puppetlabs'], File['/root/gpgkeys/RPM-GPG-KEY-EPEL-7'],
                    File['/root/gpgkeys/RPM-GPG-KEY-CentOS-7']
                  ]
  }
    
}
