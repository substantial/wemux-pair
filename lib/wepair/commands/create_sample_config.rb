require_relative 'command'
require 'fileutils'

module WePair
  module Commands
    class CreateSampleConfig < Command
      def execute
        return warn_config_exists if config_exist?
        copy_file(config_template, config_path)
        puts "Generated file at #{config_path}"
      end

      private

      def copy_file(src, dest)
        FileUtils.cp(src, dest)
      end

      def config_template
        File.join(WePair.root, 'etc', 'sample_config.yml')
      end

      def config_file
        WePair::Configuration::PAIR_CONFIG
      end

      def config_path
        File.absolute_path(config_file)
      end

      def config_exist?
        File.exist? config_file
      end

      def warn_config_exists
        puts "Skipped: config file already exists at #{config_path}"
        false
      end
    end
  end
end
