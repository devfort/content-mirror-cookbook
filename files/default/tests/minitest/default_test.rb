require 'minitest/spec'

describe 'cpan-mirror::default' do

  include MiniTest::Chef::Assertions
  include MiniTest::Chef::Context
  include MiniTest::Chef::Resources


  it 'creates the CPAN data directory' do
    directory(node['cpan_mirror']['data_dir']).must_exist
  end

  it 'installs and enables the CPAN mirror site' do
    %w{
      available
      enabled
    }.each{ |site_state|
      file("/etc/apache2/sites-#{site_state}/cpan_mirror.conf").must_exist
    }
  end

  it 'starts mirroring CPAN' do
    # TODO: Test cpan-mirror service is running using service
    #       https://github.com/calavera/minitest-chef-handler/issues/39
    # service("cpan-mirror").must_be_running
    assert_sh "service cpan-mirror status | grep 'start/running'"
  end
end
