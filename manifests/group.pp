class htcondor::group inherits htcondor {

  group { 'Creating group for HTCondor':
    ensure  => present,
    name    => $htcondor_groupname,
    gid     => $htcondor_gid,
  }
}
