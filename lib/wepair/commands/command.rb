module WePair
  module Commands
    class Command
      def self.run(attrs={})
        new(attrs).execute
      end

      def initialize(attrs={})
        attrs.each do |attr, value|
          self.class.__send__(:attr_reader, attr)
          instance_variable_set("@#{attr}", value)
        end
      end

      def execute
        raise NotImplementedError
      end
    end
  end
end
