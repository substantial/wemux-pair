require_relative 'command'
require_relative '../client_tunnel'
require_relative '../pair_connection'

module WePair
  module Commands
    class StartClientSession < Command
      def execute
        if in_tmux?
          puts "Please do not run from within tmux or wemux"
          exit 1
        end

        tunnel = ClientTunnel.new(port_offset)
        if tunnel.open
          connection = PairConnection.new(tunnel)
          connection.connect
        else
          ClientTunnel.tunnel_failure!
        end
      end
      private

      def in_tmux?
        ENV['TMUX']
      end
    end
  end
end
