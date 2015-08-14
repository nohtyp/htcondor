class samba::params {
  
  $realm                        = 'FAMILYGUY.LOCAL'
  $workgroup                    = 'FAMILYGUY'
  $active_directory_servers     = 'familyguyserver.familyguy.local'
  $home                         = "/home/%D/%U"
  $default_shell                = '/bin/bash'
  $krb5kdc                      = 'familyguyserver.familyguy.local'
  $krb5adminserver              = 'familyguyserver.familyguy.local'
  $smbworkgroup                 = 'FAMILYGUY'
  $join_user                    = 'test'
  $join_user_pw                 = '!QAZXCDe3#'
  $mydomain                     = 'familyguy.local'
  $ou                           = 'Linux/test\ ou'
  
  case $::osfamily {
    'RedHat': {
      case $::operatingsystemmajrelease 
       { 
        '6' : {
          $packages = [ 'nss-tools', 'esc', 'krb5-libs', 'krb5-workstation', 'pam_krb5', 'authconfig', 'sssd', 'sssd-tools',
                    'ccid', 'krb5-pkinit-openssl', 'oddjob-mkhomedir', 'sssd-ad', 'samba-common', 'samba-client', 'cifs-utils',
                    'samba-winbind-krb5-locator', 'samba-winbind-clients']
          $samba_services = [ 'winbind' ]
        }

        '7' : {
          $packages = [ 'coolkey', 'esc', 'pam_pkcs11', 'pcsc-lite-ccid', 'nss-tools', 'krb5-libs', 'krb5-pkinit',
                    'authconfig', 'pam_krb5', 'ntp', 'samba-winbind-krb5-locator', 'sssd', 'sssd-tools',
                    'sssd-ad', 'samba-client', 'cifs-utils', 'oddjob-mkhomedir', 'krb5-workstation', 'samba-common',
                    'realmd', 'samba', 'samba-winbind-clients']
          $samba_services = [ 'winbind', 'smb' ]
        }
       }
    }
    default: {
      fail("This ${module_name} module is not supported on a ${::osfamily} based system.")
    }
  }
}
