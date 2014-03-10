require_relative 'ssh_tunnel'

module Wemux
  module Pair
    class HostTunnel < SshTunnel
      def control_path
        "/tmp/wemux-pair-host-ssh"
      end

      def ssh_forwards
        "-R #{host_port}:localhost:22"
      end
    end
  end
end
