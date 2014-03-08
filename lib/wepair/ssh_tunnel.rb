module WePair
  class SshTunnel
    attr_reader :port_offset

    def initialize(port_offset)
      @port_offset = port_offset
    end

    def self.tunnel_failure!
      puts "The tunnel failed to open, the port was probably in use, try again."
      exit 1
    end

    def host_port
      1230 + port_offset
    end

    def client_port
      9990 + port_offset
    end

    def open
      close_tunnels
      puts "Opening tunnel..."
      system "ssh #{ssh_options} -f -N #{ssh_forwards} #{ssh_user}@#{ssh_host}"
    end

    def ssh_options
      [
        "ExitOnForwardFailure yes",
        "ControlPersist yes",
        "ControlPath #{control_path}",
        "ControlMaster auto",
      ].map { |o| "-o \"#{o}\""}.join(" ")
    end

    def close_tunnels
      puts "Closing existing tunnels..."
      system "ssh #{ssh_options} -O exit #{ssh_user}@#{ssh_host}" until $? && !$?.success?
    end

    private

    def ssh_user
      WePair.config.ssh_user
    end

    def ssh_host
      WePair.config.ssh_host
    end
  end
end
