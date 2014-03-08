require_relative 'command'

module WePair
  module Commands
    class SetPowHost < Command
      def execute
        return unless pow_host
        return unless pow_installed?
        write_pow_host
      end

      private

      def pow_installed?
        if Dir.exists?(pow_directory)
          true
        else
          puts "Couldn't find #{pow_directory}, you can get it at http://pow.cx/"
          false
        end
      end

      def write_pow_host
        File.open(pow_config, 'w+') do |f|
          f.puts(server_port)
        end
      end

      def pow_directory
        File.expand_path(File.join("~", ".pow"))
      end

      def pow_config
        File.expand_path(File.join(pow_directory, pow_host))
      end
    end
  end
end
