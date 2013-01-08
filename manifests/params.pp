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
      #TODO: Test that this works in these flavors
      $zoneinfo = '/usr/share/zoneinfo'
    }
    'ubuntu', 'debian': {
      $zoneinfo = '/usr/share/zoneinfo'
    }
    default: {
      $zoneinfo = '/usr/share/zoneinfo'
    }
  }
}
