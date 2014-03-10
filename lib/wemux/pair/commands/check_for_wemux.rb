require_relative 'command'

module Wemux::Pair
  module Commands
    class CheckForWemux < Command
      def execute
        return if in_wemux?

        if system("command -v wemux > /dev/null 2>&1")
          puts "Please run from within wemux"
        else
          puts "Please install wemux and run from within it: https://github.com/zolrath/wemux"
        end

        exit 1
      end

      private

      def in_wemux?
        ENV['TMUX'] =~ /wemux/
      end
    end
  end
end
