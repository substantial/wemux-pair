require_relative "pair/pair"
require_relative "pair/configuration"

module Wemux
  module Pair
    def self.config
      @config ||= Configuration.load
    end

    def self.root
      File.expand_path '../..', __FILE__
    end
  end
end
