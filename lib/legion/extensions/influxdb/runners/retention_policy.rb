# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Runners
        module RetentionPolicy
          include Legion::Extensions::Helpers::Lex
          extend Legion::Extensions::Influxdb::Helpers::Client

          def create(database:, _host: 'localhost', _port: 8086, **payload)
            InfluxDB::Client.new(host: payload[:host]).list_retention_policies(database)
          end

          def list(database:, _host: 'localhost', _port: 8086, **payload)
            InfluxDB::Client.new(host: payload[:host]).list_retention_policies(database)
          end

          def self.delete(payload); end

          def self.alter(payload); end
        end
      end
    end
  end
end
