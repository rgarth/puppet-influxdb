#
class influxdb::install inherits influxdb {

  if $influxdb::package_manage {

    if (!defined(Apt::Source['influxdb'])) {
      apt::source { 'influxdb':
        location   => 'https://repos.influxdata.com/debian',
        repos      => 'stable',
        key        => {
          'id'     => '05CE15085FC09D18E99EFB22684A14CF2582E0C5',
          'server' => 'pgp.mit.edu',
        },
      }
    }

    package { 'influxdb':
      ensure  => $influxdb::package_ensure,
      name    => $influxdb::package_name,
      require => Apt::Source['influxdb'],
      notify  => Exec['apt_update'],
    }
  }

}
