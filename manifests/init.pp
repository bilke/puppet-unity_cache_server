# Public: Install Unity Cache Server
#
# Examples
#
#   include unity_cache_server
class unity_cache_server {
  include unity_cache_server::config

  file { [
    $unity_cache_server::config::datadir,
  ]:
    ensure => directory,
  }

  package { 'CacheServer':
    provider => 'compressed_app',
    source   => 'http://netstorage.unity3d.com/unity/CacheServer-4.2.1.zip',
  }

  file { '/Library/LaunchDaemons/unity_cache_server.plist':
    content => template('unity_cache_server/unity_cache_server.plist.erb'),
    group   => 'wheel',
    notify  => Service['dev.unity_cache_server'],
    owner   => 'root',
    require => Package['CacheServer'],
  }

  service { 'dev.unity_cache_server':
    ensure  => running,
    require => File['/Library/LaunchDaemons/unity_cache_server.plist'],
  }
}
