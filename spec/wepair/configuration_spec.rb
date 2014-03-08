require 'spec_helper'

require 'wepair/configuration'

describe WePair::Configuration do
  let(:config_options) do
    {
      'ssh_host' => 'test_ssh_host',
      'ssh_user' => 'test_ssh_user',
      'pair_user' => 'test_pairprogramming'
    }
  end

  describe '.load' do
    it "raises error if .pair.yml isn't found" do
      expect { WePair::Configuration.load }.to raise_error('.pair.yml configuration not found')
    end

    it "returns a configuration if .pair.yml exists" do
      use_test_config

      WePair::Configuration.load.should be_an_instance_of WePair::Configuration
    end

    it "should set ssh configuration" do
      use_test_config

      config = WePair::Configuration.load
      config.ssh_host.should eq 'test_ssh_host'
      config.ssh_user.should eq 'test_ssh_user'
      config.pair_user.should eq 'test_pairprogramming'
    end
  end

  it "should throw an error if config is missing ssh property" do
    expect { WePair::Configuration.new({}) }.to raise_error KeyError
  end

  describe '#pow_host' do
    it "is set from config" do
      WePair::Configuration.new(config_options.merge('pow_host' => 'foo')).pow_host.should eq 'foo'
    end

    it "is nil by default" do
      WePair::Configuration.new(config_options).pow_host.should be_false
    end
  end

  def use_test_config
    test_config_yaml = File.join(SPEC_ROOT, 'fixtures', 'test_config.yml')
    stub_const('WePair::Configuration::PAIR_CONFIG', test_config_yaml)
  end
end
