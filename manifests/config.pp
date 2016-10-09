#
class influxdb::config inherits influxdb {
  if $influxdb::config_manage {
    file { 'influxdb.conf':
      ensure  => $influxdb::config_ensure,
      name    => $influxdb::config_name,
      content => template($influxdb::config_template),
    }
  }
}
