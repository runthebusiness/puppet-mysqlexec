# Class: mysqlexec::loadtimezones
#
# This class loads mysql time zones
#
# Parameters:
#  - $logoutput: log level for output (Default: 'on_failure')
#  - $password: optional rootpassword to use when trying to load the mysql data (Default: undef)

define mysqlexec::loadtimezones(
	$logoutput='on_failure',
	$password=undef
) {
  
  include mysqlexec::params
  
  if $password != undef {
    $append = "--password='${password}'"
  } else {
    $append = ""
  }
	$execname =  "${name}_mysqlloadzoneinfo"
	$command = "mysql_tzinfo_to_sql ${mysqlexec::params::zoneinfo} | mysql -u root ${append} mysql"
  exec {$execname:
    command=>$command,
    cwd=> $mysqlexec::params::executefrom,
    path=> $mysqlexec::params::execlaunchpaths,
    logoutput=> $logoutput, 
  }
}
