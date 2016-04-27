module Wemux
  module Pair
    class PairConnection
      attr_reader :tunnel
      def initialize(tunnel)
        @tunnel = tunnel
      end

      def port_offset
        tunnel.port_offset
      end

      def client_port
        tunnel.client_port
      end

      def offset_port(port)
        port + port_offset
      end

      def ssh_options
        [
          "StrictHostKeyChecking no",
          "UserKnownHostsFile /dev/null",
        ].map { |o| "-o \"#{o}\""}.join(" ")
      end

      def connect
        system [
          "ssh",
          ssh_options,
          "-L #{offset_port(3000)}:localhost:3000",
          "-L #{offset_port(4000)}:localhost:4000",
          "-p #{client_port}",
          "#{Wemux::Pair.config.pair_user}@localhost",
        ].join(" ")
      end
    end
  end
end
