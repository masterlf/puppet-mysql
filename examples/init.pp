node default {

  class { 'mysql::mysql_server': 
    $bind_address => '0.0.0.0',
  }
}
