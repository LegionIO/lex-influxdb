module Legion::Extensions::Influxdb
  module Runners
    module Database
      def self.create(name:, host: 'localhost', port: 8086, **payload)
        # client = InfluxDB::Client.new(host: host, port: port)
        require 'influxdb'
        client = InfluxDB::Client.new
        Legion::Logging.unknown({ name: name, host: host, port: port, **payload })
        Legion::Logging.fatal client.create_database(name)
        { name: name, host: host, port: port, **payload }
      rescue StandardError => e
        Legion::Logging.error e.message
        Legion::Logging.error e.backtrace
      end

      def self.delete(name:, host: 'localhost', port: 8086, **payload)
        client = InfluxDB::Client.new(host: payload[:host])
        client.delete_database(payload[:name])
      end

      def self.list(host: 'localhost', port: 8086, **payload)
        InfluxDB::Client.new(host: payload[:host]).list_databases
      end

      def self.field_keys(database: 'telegraf', host: 'localhost', port: 8086, **payload)
        client = InfluxDB::Client.new(host: payload[:host], port: port, database: database)
        { results: client.show_field_keys, count: client.show_field_keys.count }
      end
    end
  end
end
