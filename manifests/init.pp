# mysqlexec
#
# This class runs mysql functions from the command line
#
# Parameters:
#  - $host: the server to run the command on (Default: undef)
#  - $dbname: the database on use (Default: undef)
#  - $username: the username to run the command with (Default: undef)
#  - $password: the password to run the command with (Default: undef)
#  - $command: the command to run (Default: undef)
#  - $unless: an unless for the command (Default: undef)
#  - $mysqlunless: an unless for the command to be executed in mysql that should return true or false. Overrides the unless command (Default: undef)
#  - $logoutput: log level for output (Default: 'on_failure')

define mysqlexec(
	$host=undef,
	$dbname=undef,
	$username=undef,
	$password=undef,
	$mysqlcommand=undef,
	$unless=undef,
	$mysqlunless=undef,
	$logoutput='on_failure'
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
	  }
	} else {
		exec {$execname:
      command=>$command,
      cwd=> $mysqlexec::params::executefrom,
      path=> $mysqlexec::params::execlaunchpaths,
      unless=>$unless,
      logoutput=> $logoutput,
		}
	}
}
