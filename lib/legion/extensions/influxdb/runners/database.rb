# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Runners
        module Database
          def create; end

          def delete; end

          def self.list(payload)
            client = InfluxDB::Client.new(host: payload[:host])
            { success: true, results: client.list_databases, count: client.list_databases.count }
          rescue => e
            { success: false, error: e.message.to_s }
          end

          def self.field_keys(payload)
            client = InfluxDB::Client.new(host: payload[:host], database: payload[:database])
            { success: true, results: client.show_field_keys, count: client.show_field_keys.count }
          rescue => e
            { success: false, error: e.message.to_s }
          end
        end
      end
    end
  end
end
