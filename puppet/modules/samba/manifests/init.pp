# == Class: samba
#
# Full description of class samba here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { smartcard:
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
class samba (
  $packages                     = $samba::params::packages,
  $realm                        = $samba::params::realm,
  $active_directory_servers     = $samba::params::active_directory_servers,
  $home                         = $samba::params::home,
  $default_shell                = $samba::params::default_shell,
  $krb5kdc                      = $samba::params::krb5kdc,
  $krb5adminserver              = $samba::params::krb5adminserver,
  $smbworkgroup                 = $samba::params::smbworkgroup,
  $join_user                    = $samba::params::join_user,
  $join_user_pw                 = $samba::params::join_user_pw,
  $mydomain                     = $samba::params::mydomain,
  $samba_services		            = $samba::params::samba_services,
  $ou                           = $samba::params::ou,

) inherits samba::params {
  
validate_array($packages)

anchor {'samba::begin': } ->
  class {'::samba::install':} ->
  class {'::samba::authconfig':} ->
  class {'::samba::config':} -> 
  class {'::samba::join':} -> 
  class {'::samba::keytab':} -> 
  class {'::samba::service':} -> 
  class {'::samba::filecreate':} ->
  class {'::samba::sambacron':} ->
anchor {'samba::end':}
}
