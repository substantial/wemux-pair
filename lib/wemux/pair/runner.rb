require 'highline/import'

require_relative 'commands/print_usage'
require_relative 'commands/stop_session'
require_relative 'commands/start_host_session'
require_relative 'commands/start_client_session'
require_relative 'commands/check_for_wemux'
require_relative 'commands/check_for_pair_user'
require_relative 'commands/create_sample_config'
require_relative 'commands/set_pow_host'
require_relative '../pair'

module Wemux
  module Pair
    class Runner
      def self.run(params)
        new(params).execute
      end

      attr_reader :param
      def initialize(param)
        @param = param.to_s.strip
      end

      def execute
        case param
        when "host"
          Commands::CheckForPairUser.run(pair_user: Wemux::Pair.config.pair_user)
          Commands::CheckForWemux.run
          Commands::StartHostSession.run
        when "stop"
          Commands::StopSession.run
        when ->(param) { param.to_i > 0 }
          port_offset = param.to_i
          Commands::SetPowHost.run(
            pow_host: Wemux::Pair.config.pow_host,
            server_port: port_offset + 3000)
          Commands::StartClientSession.run(port_offset: port_offset)
        when "--init"
          Commands::CreateSampleConfig.run
        else
          Commands::PrintUsage.run
        end
      end
    end
  end
end
