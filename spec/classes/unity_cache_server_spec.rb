require 'spec_helper'

describe 'unity_cache_server' do
  let(:facts) do
    {
      :boxen_home => '/opt/boxen',
      :boxen_user => 'testuser',
    }
  end

  it do
    should contain_class('unity_cache_server::config')

    should contain_package('CacheServer').with({
      :source   => 'http://netstorage.unity3d.com/unity/CacheServer-4.5.1.zip',
      :provider => 'compressed_app'
    })

    should contain_service('dev.unity_cache_server').with(:ensure => 'running')
  end
end
