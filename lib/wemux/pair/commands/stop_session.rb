require_relative 'command'
require_relative '../host_tunnel'

module Wemux
  module Pair
    module Commands
      class StopSession < Command
        def execute
          HostTunnel.new(0).close_tunnels
        end
      end
    end
  end
end
