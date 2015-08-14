class htcondor::user inherits htcondor {

  user { 'Creating account for HTCondor':
    ensure      => present,
    name        => $condor_username,
    uid         => $condor_uid,
    gid         => $condor_gid,
    groups      => ["$condor_groups"],
    shell       => $condor_shell,
    home        => $condor_home,
    managehome  => true,
    require     => Group['Creating group for HTCondor'],
  }
}
