require_relative 'command'
require_relative '../clipboard'
require_relative '../host_tunnel'

module Wemux::Pair
  module Commands
    class StartHostSession < Command
      def execute
        tunnel = HostTunnel.new(offset)

        if tunnel.open
          command = "pair #{offset}"
          Clipboard.copy command
          puts ""
          puts "Host tunnel is set up, client should run (this has been copied to your clipboard):"
          puts "$ #{command}"
          puts ""
          puts "Once connected, they can use http://localhost:#{3000 + offset}/"
        else
          HostTunnel.tunnel_failure!
        end
      end

      private

      def offset
        @offset ||= 1 + rand(999)
      end
    end
  end
end
