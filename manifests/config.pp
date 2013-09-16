# Internal: Configuration settings for Unity Cache Server
#
# Examples:
#
#   include unity_cache_server::config
class unity_cache_server::config {
  require boxen::config

  $datadir     = "${boxen::config::datadir}/unity_cache_server"
  $executable  = '/Applications/Unity Cache Server/RunOSX.command'
  $consolefile = "${logdir}/console.log"
  $port        = 8125
  $size        = 53687091200
}
