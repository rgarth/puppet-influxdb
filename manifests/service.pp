#
class influxdb::service inherits influxdb {

  if $influxdb::service_manage {
    service { 'influxdb':
      ensure => $influxdb::service_ensure,
      name   => $influxdb::service_name,
    }
  }

}
