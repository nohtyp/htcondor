class htcondor::config_dir inherits htcondor {

  file { 'Managing HTCondor config.d':
    ensure  => directory,
    path    => $htcondor_config_d,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    source  => $condor_config_d_path,
    recurse => true,
    require => Package['Installing HTCondor'],
  }
}
