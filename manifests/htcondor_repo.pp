class htcondor::htcondor_repo inherits htcondor {

  yumrepo { 'Creating yum repository for HTCondor':
    ensure   => present,
    name     => $reponame,
    descr    => "This is the HTCondor yum repo.",
    baseurl  => "http://research.cs.wisc.edu/htcondor/yum/stable/rhel${::operatingsystemmajrelease}",
    enabled  => 'yes',
    gpgcheck => 'no',
  }
}
