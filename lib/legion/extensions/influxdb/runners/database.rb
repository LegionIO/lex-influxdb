# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Runners
        module Database
          include Legion::Extensions::Helpers::Lex

          def self.create(name:, host: 'localhost', port: 8086, **payload)
            require 'influxdb'
            client = InfluxDB::Client.new
            log.info({ name: name, host: host, port: port, **payload })
            log.fatal client.create_database(name)
            { name: name, host: host, port: port, **payload }
          rescue StandardError => e
            log.error e.message
            log.error e.backtrace
          end

          def self.delete(_name:, _host: 'localhost', _port: 8086, **payload)
            client = InfluxDB::Client.new(host: payload[:host])
            client.delete_database(payload[:name])
          end

          def self.list(_host: 'localhost', _port: 8086, **payload)
            InfluxDB::Client.new(host: payload[:host]).list_databases
          end

          def self.field_keys(database: 'telegraf', _host: 'localhost', port: 8086, **payload)
            client = InfluxDB::Client.new(host: payload[:host], port: port, database: database)
            { results: client.show_field_keys, count: client.show_field_keys.count }
          end
        end
      end
    end
  end
end
