require_relative 'ssh_tunnel'

module WePair
  class ClientTunnel < SshTunnel
    def control_path
      "/tmp/wepair-client-ssh"
    end

    def ssh_forwards
      "-L #{client_port}:localhost:#{host_port}"
    end
  end
end
