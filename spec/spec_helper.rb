# frozen_string_literal: true

require 'bundler/setup'

module Legion
  module Extensions
    module Core; end

    module Helpers
      module Lex; end
    end
  end

  module Logging
    def self.unknown(*); end

    def self.fatal(*); end

    def self.error(*); end
  end

  module JSON
    def self.load(obj)
      obj.is_a?(String) ? ::JSON.parse(obj, symbolize_names: true) : obj
    end
  end
end

require 'json'
require 'legion/extensions/influxdb'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
