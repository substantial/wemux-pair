require_relative "wepair/pair"
require_relative "wepair/configuration"

module Wemux::Pair
  def self.config
    @config ||= Configuration.load
  end

  def self.root
    File.expand_path '../..', __FILE__
  end
end
