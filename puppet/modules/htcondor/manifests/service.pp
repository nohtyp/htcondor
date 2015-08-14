class htcondor::service inherits htcondor {

  service { 'HTCondor Service':
    ensure      => running,
    name        => $htcondor_service,
    enable      => true,
    hasrestart  => true,
    hasstatus   => true,
    require     => Package['Installing HTCondor'],
    subscribe   => File['Creating HTCondor config file'],
  }
}
