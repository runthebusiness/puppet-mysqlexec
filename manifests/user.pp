# Class: mysqlexec::user
#
# This class runs mysql functions from the command line to make sure that user is present or absent
#
# Parameters:
#  - $host: the server to run the command on (Default: undef)
#  - $althost: if set mysql commands that reference a host (such as ones that grant access for a user to a host) will use this host instead of the one being used to establish the connection. This is useful when you want to grant access to people who will be connecting from a different host (Default: undef)
#  - $username: the username to run the command with (Default: undef)
#  - $password: the password to run the command with (Default: undef)
#  - $dbuser: the user to ensure (Default: undef)
#  - $dbpassword: the user password to ensure (Default: undef)
#  - $privileges: the privileges to grant users on $dbname (Default: [])
#  - $dbname: the target to apply the privileges to (Default: undef)
#  - $ensure: ensure for that user (Default: 'present')
#  - $logoutput: log level for output (Default: 'on_failure')

define mysqlexec::user(
  $host=undef,
  $althost=undef,
  $username=undef,
  $password=undef,
  $dbuser=undef,
  $dbpassword=undef,
  $privileges = [],
  $dbname =undef,
  $ensure='present',
  $logoutput='on_failure'
) {
  if $althost != undef {
    $onhost = $althost
  } else{
   $onhost = $host
  }
  if $ensure== 'present' {
    $command = template('mysqlexec/userpresent.erb')
    mysqlexec{"${name}_mysqldbuserpresent":
      host=>$host,
      username=>$username,
      password=>$password,
      mysqlcommand=>$command,
      logoutput=>$logoutput
    }
  } else {
    $command = template('mysqlexec/userabsent.erb')
    mysqlexec{"${name}_mysqldbuserabsent":
      host=>$host,
      username=>$username,
      password=>$password,
      mysqlcommand=>$command,
      logoutput=>$logoutput
    }
  }
  
}
