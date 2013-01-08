# Class: mysqlexec::loadtimezones
#
# This class loads mysql time zones
#
# Parameters:
#  - $logoutput: log level for output (Default: 'on_failure')

define mysqlexec::loadtimezones(
	$logoutput='on_failure'
) {
  
  include mysqlexec::params
  
	$execname =  "${name}_mysqlloadzoneinfo"
	$command = "mysql_tzinfo_to_sql ${mysqlexec::params::zoneinfo} | mysql -u root mysql"
  exec {$execname:
    command=>$command,
    cwd=> $mysqlexec::params::executefrom,
    path=> $mysqlexec::params::execlaunchpaths,
    logoutput=> $logoutput, 
  }
}
