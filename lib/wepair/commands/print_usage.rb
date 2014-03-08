require_relative 'command'

module WePair
  module Commands
    class PrintUsage < Command
      def execute
        puts "pair host"
        puts "pair stop"
        puts "pair <number>"
        puts "pair --init # Create a sample .pair.yml file."
      end
    end
  end
end
