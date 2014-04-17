# mysqlexec
#
# This class runs mysql functions from the command line
#
# Parameters:
#  - $host: the server to run the command on (Default: undef)
#  - $username: the username to run the command with (Default: undef)
#  - $password: the password to run the command with (Default: undef)
#  - $command: the command to run (Default: undef)
#  - $unless: an unless for the command (Default: undef)
#  - $mysqlunless: an unless for the command to be executed in mysql that should return true or false. Overrides the unless command (Default: undef)
#  - $logoutput: log level for output (Default: 'on_failure')
#  - $schedule: contrain to a pre-defined schedule (Default: undef)

define mysqlexec(
	$host=undef,
	$username=undef,
	$password=undef,
	$mysqlcommand=undef,
	$unless=undef,
	$mysqlunless=undef,
	$logoutput='on_failure',
	$schedule=undef
) {
  
	include mysqlexec::params
  
	$execname =  "${name}_mysqlexec"
	$escapedcommand = regsubst($mysqlcommand,'\'','\\\'', 'G')
	$command = template('mysqlexec/runcommand.erb')
  
	if $mysqlunless != undef {
		$escapedunless = regsubst($mysqlunless,'\'','\\\'', 'G')
		$unlesscommand = template('mysqlexec/rununless.erb')
		exec {$execname:
			command=>$command,
			unless=>$unlesscommand,
			cwd=> $mysqlexec::params::executefrom,
			path=> $mysqlexec::params::execlaunchpaths,
			logoutput=> $logoutput, 
			schedule=>$schedule,
		}
	} else {
		exec {$execname:
			command=>$command,
			cwd=> $mysqlexec::params::executefrom,
			path=> $mysqlexec::params::execlaunchpaths,
			unless=>$unless,
			logoutput=> $logoutput,
			schedule=>$schedule,
		}
	}
}
