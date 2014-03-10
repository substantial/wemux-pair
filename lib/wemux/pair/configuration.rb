require 'yaml'

module Wemux::Pair
  class Configuration
    PAIR_CONFIG = '.pair.yml'

    def self.load
      new(YAML.load_file(PAIR_CONFIG))
    rescue Errno::ENOENT
      raise "#{PAIR_CONFIG} configuration not found"
    end

    attr_reader :ssh_host, :ssh_user, :pair_user, :pow_host

    def initialize(config)
      @ssh_host = config.fetch('ssh_host')
      @ssh_user = config.fetch('ssh_user')
      @pair_user = config.fetch('pair_user')
      @pow_host = config.fetch('pow_host') { nil }
    end
  end
end
