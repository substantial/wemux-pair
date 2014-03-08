require_relative 'command'

module WePair
  module Commands
    class CheckForPairUser < Command
      def execute
        return if system("id -u #{pair_user} > /dev/null 2>&1")
        puts "There is some setup to do before this will work."
        puts "1. Create a user named \"#{pair_user}\""
        puts "2. Put team's ssh public keys in ~/#{pair_user}/.ssh/authorized_keys (make sure it is owned by #{pair_user} and chmod 600)."

        exit 1
      end
    end
  end
end
