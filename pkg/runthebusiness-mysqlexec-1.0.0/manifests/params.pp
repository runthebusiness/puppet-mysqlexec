# Class: mysqlexec::params
#
# Params for mysqlexec
#
# Parameters:
#
# Sample Usage:
#
class mysqlexec::params {
	$execlaunchpaths = ["/usr/bin", "/usr/sbin", "/bin", "/sbin", "/etc"]
	$executefrom = "/tmp/"
	
	case $::operatingsystem {
    'centos', 'redhat', 'fedora': {
      #needs filling in
    }
    'ubuntu', 'debian': {
      $zoneinfo = '/usr/share/zoneinfo'
    }
    default: {
      $zoneinfo = '/usr/share/zoneinfo'
    }
  }
}
