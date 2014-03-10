require_relative 'ssh_tunnel'

module Wemux::Pair
  class ClientTunnel < SshTunnel
    def control_path
      "/tmp/wemux-pair-client-ssh"
    end

    def ssh_forwards
      "-L #{client_port}:localhost:#{host_port}"
    end
  end
end
