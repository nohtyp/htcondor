class htcondor::install inherits htcondor {

  package { 'Installing HTCondor':
    ensure  => present,
    name    => $htcondor,
  }
}
