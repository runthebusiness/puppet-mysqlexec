name 'runthebusiness-mysqlexec'
version '1.0.1'

author 'runthebusiness'
license 'Apache License, Version 2.0'
project_page 'https://github.com/runthebusiness/puppet-mysqlexec'
source 'UNKNOWN'
summary 'This class runs mysql functions from the command line.'
description 'mysqlexec

This class runs mysql functions from the command line.

This module does not manage the installation and configuration of mysql but is instead focused on invoking mysql commands from the command line.

Here are some key features:

1) The ability to run commands on a remote database instead of just on the local machine (The initial reason why we wrote the module)
2) The ability to run *any* sql command through puppet
3) The ability to set up unless conditions that can be written as command line execution or a mysql query
4) Handling for the zoneinfo file
5) Built in handling of: users / user privileges, schemas and populating table data loaded from flat files

Examples:

mysqlexec{"mysqlexecexample":
	host=><host to run the command on>,
	username=><username>,
	password=><password>,
	mysqlcommand=><mysql command to run>,
	mysqlunless=><an mysql query that returns true or false, if true the command will not run>,
}


mysqlexec::db{"mysqldbexecexample":
	host=><host to run the command on>,
	username=><username>,
	password=><password>,
	dbname=<schema to create or remove>,
    ensure=<present or absent>,
}

mysqlexec::loaddata{"mysqlloaddataexecexample":
	host=><host to run the command on>,
	username=><username>,
	password=><password>,
	table=><table to load data into>,
	filepath=<file to load data from>,
	columns=>[<list of columns stored in file>],
	checkdata=><will bypass the other unless functions and use the built in checkdata functionality of the module, this uses the mysqlunless functionality to see if there is already data in the table>,
	replace=><if true then a replace will happen other wise it is an insert ignore>,
}

mysqlexec::user{"mysqluserexecexample":
	host=><host to run the command on>,
	username=><username>,
	password=><password>,
	dbuser=><user name of the user we are managing>,
  	dbpassword=><a password for the user we are managing>,
	privileges => [<privlileges to assign to the user>],
	dbname =><name of the schema to assign the privileges on>,
	ensure=><present or absent>
}


This module has been tested in debian squeeze, if you use it in another flavor and it works fine as is or if you have improvements to the params class to allow it to work in your flavor please let us know.

Authors
-------
Will Ferrer, Ethan Brooks

Licensees
-------
2012 developed under license for Switchsoft LLC http://www.switchsoft.com a "Direct response telephony company" as part of it\'s "VOIP Call distribution, ROI analysis platform, call recording, and IVR for inbound and outbound sales" and Run the Business Systems LLC a "Technology development investment group" as part of it\'s "PHP, Javascript rapid application development framework and MySQL analysis tools"

License
-------
Licensed under the terms of the Open Source LGPL 3.0 license.  


Contact
-------
will.ferrer@runthebusiness.net

Support
-------

Please send tickets and issues to our contact email address or at: https://github.com/runthebusiness/puppet-mysqlexec/issues

Project Url
-------
https://github.com/runthebusiness/puppet-mysqlexec
'
