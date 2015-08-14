class  htcondor::params {

$htcondor            = 'condor'
$condor_username     = 'condor'
$condor_uid          = '444'
$condor_gid          = '444'
$condor_groups       = ['condor']
$condor_shell        = '/sbin/nologin'
$condor_home         = '/var/lib/condor'
$htcondor_groupname  = 'condor'
$htcondor_gid        = '444'
$reponame            = 'htcondor'
$config_path         = '/etc/condor/condor_config'
$htcondor_service    = 'condor'
$use_central_repo    = 'false'
$schedd_host         = 'test02.familyguy.local'
$mydomain            = '*.familyguy.local'
$cluster_name        = 'Cluster1'
$daemon_list         = 'COLLECTOR, MASTER, NEGOTIATOR, SCHEDD, STARTD'

}
