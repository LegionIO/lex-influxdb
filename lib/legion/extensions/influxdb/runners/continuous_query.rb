# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Runners
        module ContinuousQuery
          def self.list(host: 'localhost', port: 8086, **_payload)
            InfluxDB::Client.new(host: host, port: port)
          end

          def self.create(name:, host: 'localhost', port: 8086, **_payload)
            InfluxDB::Client.new(host: host, port: port)
          end

          def self.delete(name:, host: 'localhost', port: 8086, **_payload)
            InfluxDB::Client.new(host: host, port: port)
          end
        end
      end
    end
  end
end
