class htcondor::htcondor_config inherits htcondor {

file { 'Creating HTCondor config file':
    ensure  => present,
    path    => $config_path,
    mode    => '0644',
    owner   => 'root',
    group   => 'root',
    backup  => true,
    content => template('htcondor/htcondor.erb'),
  }
}
