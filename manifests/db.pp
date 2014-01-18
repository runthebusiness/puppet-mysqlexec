# Class: mysqlexec::db
#
# This class runs mysql functions from the command line to make sure that a db is present or absent
#
# Parameters:
#  - $host: the server to run the command on (Default: undef)
#  - $username: the username to run the command with (Default: undef)
#  - $password: the password to run the command with (Default: undef)
#  - $dbname: the user to ensure (Default: undef)
#  - $ensure: ensure for the db (Default: 'present')
#  - $logoutput: log level for output (Default: 'on_failure')

define mysqlexec::db(
  $host=undef,
  $dbname=undef,
  $username=undef,
  $password=undef,
  $ensure='present',
  $logoutput='on_failure'
) {
  if $ensure== 'present' {
    $command = template('mysqlexec/dbpresent.erb')
    mysqlexec{"${name}_mysqldbpresent":
      host=>$host,
      dbname=>$dbname,
      username=>$username,
      password=>$password,
      mysqlcommand=>$command,
      logoutput=>$logoutput
    }
  } else {
    $command = template('mysqlexec/dbabsent.erb')
    mysqlexec{"${name}_mysqldbabsent":
      host=>$host,
      dbname=>$dbname,
      username=>$username,
      password=>$password,
      mysqlcommand=>$command,
      logoutput=>$logoutput
    }
  }
  
}
