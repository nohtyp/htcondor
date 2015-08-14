# == Class: cac
#
# Full description of class cac here.
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
#  class { cac:
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
class cac (
  $cacfiles  = $cac::params::cacfiles,
) inherits cac::params {

  validate_string($cacfile1)
  validate_string($cacfile2)
  validate_string($cacfile3)
  validate_string($cacfile4)
  validate_string($cacfile5)
  validate_string($cacfile6)

anchor {'cac::begin': } ->
  class {'::cac::files': } ->
  class {'::cac::config': } ->
  class {'::cac::users': } ->
anchor {'cac::end': }
}
