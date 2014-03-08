module WePair
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

    def rails_server_port
      3000 + port_offset
    end

    def ssh_options
      [
        "StrictHostKeyChecking no",
        "UserKnownHostsFile /dev/null",
      ].map { |o| "-o \"#{o}\""}.join(" ")
    end

    def connect
      system "ssh #{ssh_options} -L #{rails_server_port}:localhost:3000 -p #{client_port} #{WePair.config.pair_user}@localhost"
    end
  end
end
