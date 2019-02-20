# install mysql server
class mysql::mysql_server (
  $manage_config = $mysql::params::manage_config,
  $manage_package = $mysql::params::manage_package,
  $bind_address = $mysql::params::bind_address,
) inherits mysql::params {
  case $operatingsystem {
    'Ubuntu': {
      case $::operatingsystemrelease {
        '16.04': {
          if $manage_package {
            package {'mysql-server':
              ensure => present,
            }
          }
          if $manage_config {
            file {'/etc/mysql/mysql.conf/mysqld.cnf':
              user    => 'root',
              group   => 'root',
              mode    => '0644',
              content => template('mysqld.cnf.epp')
            }
          }
        }
        default: {
          fail('currently not supported')
        }
      }
    }
    default: {
      fail('currently not supported')
    }
  }
}
