# Class: mysqlexec::loaddata
#
# This class runs mysql functions from the command line to load data from a file
#
# Parameters:
#  - $host: the server to run the command on (Default: undef)
#  - $althost: if set mysql commands that reference a host (such as ones that grant access for a user to a host) will use this host instead of the one being used to establish the connection. This is useful when you want to grant access to people who will be connecting from a different host (Default: undef)
#  - $username: the username to run the command with (Default: undef)
#  - $password: the password to run the command with (Default: undef)
#  - $dbname: db to load into (Default: undef)
#  - $table: table to load into (Default: undef)
#  - $filepath: file to load from (Default: undef)
#  - $columns: columns to import (Default: undef)
#  - $unless: an unless for the command. (Default: undef)
#  - $mysqlunless: an unless for the command to be executed in mysql that should return true or false (Default: undef)
#  - $checkdata: will bypass the other unless functions and use the built in checkdata functionality of the module, this uses the mysqlunless functionality to see if there is already data in the table (Default: false)
#  - $replace: whether to replace or ignor during the load data (Default: true)
#  - $logoutput: log level for output (Default: 'on_failure')
#  - $flags: flags (such as LOCAL) to put in the mysql query for the load (Default: '')

define mysqlexec::loaddata(
  $host=undef,
  $althost=undef,
  $username=undef,
  $password=undef,
  $table=undef,
  $filepath=undef,
  $columns=[],
  $unless=undef,
  $mysqlunless=undef,
  $checkdata=undef,
  $replace=true,
  $logoutput='on_failure',
  $flags=''
) {
  if $althost != undef {
    $onhost = $althost
  } else{
   $onhost = $host
  }
  
  if $replace == true{
    $loadtype = "REPLACE"
  } else {
    $loadtype = "IGNORE"
  }
  $command = template('mysqlexec/loaddata.erb')

  if $checkdata == true { 
    $unlesscommand = template('mysqlexec/checkdata.erb')
	  mysqlexec{"${name}_mysqlloaddata":
	    host=>$host,
	    username=>$username,
	    password=>$password,
	    mysqlcommand=>$command,
	    mysqlunless=>$unlesscommand,
	    logoutput=>$logoutput
	  }
	} else {
	  mysqlexec{"${name}_mysqlloaddata":
      host=>$host,
      username=>$username,
      password=>$password,
      mysqlcommand=>$command,
      mysqlunless=>$unlesscommand,
      unless=>$unless,
      logoutput=>$logoutput
    }
	}
}
