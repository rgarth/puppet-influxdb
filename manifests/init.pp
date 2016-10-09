#
class influxdb (

  $package_manage  = $influxdb::params::package_manage,
  $package_ensure  = $influxdb::params::package_ensure,
  $package_name    = $influxdb::params::package_name,

  $service_manage  = $influxdb::params::service_manage,
  $service_ensure  = $influxdb::params::service_ensure,
  $service_name    = $influxdb::params::service_name,

  $config_manage   = $influxdb::params::config_manage,
  $config_ensure   = $influxdb::params::config_ensure,
  $config_name     = $influxdb::params::config_name,
  $config_template = $influxdb::params::config_template,

  $collectd_enable   = $influxdb::params::collectd_enable,
  $collectd_port     = $influxdb::params::collectd_port,
  $collectd_database = $influxdb::params::collectd_database,
  $collectd_typesdb  = $influxdb::params::collectd_typesdb,


) inherits influxdb::params {

  validate_bool($package_manage)
  validate_re($package_ensure, '^installed|absent|latest$')
  validate_string($package_name)

  validate_bool($service_manage)
  validate_re($service_ensure, '^running|stopped$')
  validate_string($service_name)

  validate_bool($config_manage)
  validate_re($config_ensure, '^file|absent$')
  validate_absolute_path($config_name)
  validate_string($config_template)

  # http://docs.puppetlabs.com/puppet/2.7/reference/lang_containment.html#known-issues
  anchor { 'influxdb::begin': } ->
  class { '::influxdb::install': } ->
  class { '::influxdb::config': } ~>
  class { '::influxdb::service': } ->
  anchor { 'influxdb::end': }

}
