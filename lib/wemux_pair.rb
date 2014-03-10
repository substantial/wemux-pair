require_relative "wemux/pair/pair"
require_relative "wemux/pair/configuration"

module Wemux::Pair
  def self.config
    @config ||= Configuration.load
  end

  def self.root
    File.expand_path '../..', __FILE__
  end
end
