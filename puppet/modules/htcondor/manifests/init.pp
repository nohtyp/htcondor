# == Class: htcondor
#
# Full description of class htcondor here.
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
#  class { htcondor:
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
class htcondor (
$htcondor                = $htcondor::params::htcondor,
$condor_username         = $htcondor::params::condor_username,
$condor_uid              = $htcondor::params::condor_uid,
$condor_gid              = $htcondor::params::condor_gid,
$condor_groups           = $htcondor::params::condor_groups,
$condor_shell            = $htcondor::params::condor_shell,
$condor_home             = $htcondor::params::condor_home,
$htcondor_groupname      = $htcondor::params::htcondor_groupname,
$htcondor_gid            = $htcondor::params::htcondor_gid,
$reponame                = $htcondor::params::reponame,
$config_path             = $htcondor::params::config_path,
$htcondor_service        = $htcondor::params::htcondor_service,
$use_condor_repo         = $htcondor::params::use_condor_repo,
$schedd_host             = $htcondor::params::schedd_host,
$mydomain                = $htcondor::params::mydomain,
$cluster_name            = $htcondor::params::cluster_name,
$daemon_list             = $htcondor::params::daemon_list,
$htcondor_config_d       = $htcondor::params::htcondor_config_d,
$condor_config_d_path    = $htcondor::params::condor_config_d_path,

) inherits htcondor::params {

if $use_condor_repo == 'false' {
    anchor {'htcondor::begin': } ->
      class {'::htcondor::group': } ->
      class {'::htcondor::user': } ->
      class {'::htcondor::install': } ->
      class {'::htcondor::htcondor_config':} ->
      class {'::htcondor::config_dir':} ->
      class {'::htcondor::service':} ->
    anchor {'htcondor::end': }
}
else {
    anchor {'htcondor::begin': } ->
      class {'::htcondor::group': } ->
      class {'::htcondor::user': } ->
      class {'::htcondor::htcondor_repo': } ->
      class {'::htcondor::install': } ->
      class {'::htcondor::htcondor_config':} ->
      class {'::htcondor::config_dir':} ->
      class {'::htcondor::service':} ->
    anchor {'htcondor::end': }
  }
}
