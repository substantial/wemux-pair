require_relative 'ssh_tunnel'

module WePair
  class HostTunnel < SshTunnel
    def control_path
      "/tmp/wepair-host-ssh"
    end

    def ssh_forwards
      "-R #{host_port}:localhost:22"
    end
  end
end
