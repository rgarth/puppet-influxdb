#
class influxdb::params {

  $package_manage = true
  $package_ensure = installed
  $package_name = 'influxdb'

  $service_manage = true
  $service_ensure = running
  $service_name = 'influxdb'

  $config_manage = true
  $config_ensure = file
  $config_name = '/etc/influxdb/influxdb.conf'
  $config_template = 'influxdb/influxdb.conf.erb'

  $collectd_enable = false
  $collectd_port = 25826
  $collectd_database = 'collectd_db'
  $collectd_typesdb = '/usr/share/collectd/types.db'

}
