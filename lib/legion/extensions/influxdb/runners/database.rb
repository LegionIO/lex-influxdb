module Legion::Extensions::Influxdb
  module Runners
    module Database
      def self.create(name:, host: 'localhost', port: 8086, **payload)
        client = InfluxDB::Client.new(host: host, port: port)
        client.create_database(payload[:name])
      end

      def self.delete(name:, host: 'localhost', port: 8086, **payload)
        client = InfluxDB::Client.new(host: payload[:host])
        client.delete_database(payload[:name])
      end

      def self.list(host: 'localhost', port: 8086, **payload)
        client = InfluxDB::Client.new(host: payload[:host])
        { success: true, results: client.list_databases, count: client.list_databases.count }
      rescue StandardError => e
        Legion::Logging.error e.message
        { success: false, error: e.message.to_s }
      end

      def self.field_keys(database: 'telegraf', host: 'localhost', port: 8086, **payload)
        client = InfluxDB::Client.new(host: payload[:host], database: payload[:database])
        { success: true, results: client.show_field_keys, count: client.show_field_keys.count }
      rescue StandardError => e
        { success: false, error: e.message.to_s }
      end
    end
  end
end
