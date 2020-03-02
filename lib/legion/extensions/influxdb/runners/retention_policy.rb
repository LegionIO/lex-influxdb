module Legion::Extensions::Influxdb
  module Runners
    module RetentionPolicy
      include Legion::Extensions::Helpers::Lex
      extend Legion::Extensions::Influxdb::Helpers::Client

      def create(database:, host: 'localhost', port: 8086, **payload)
        InfluxDB::Client.new(host: payload[:host]).list_retention_policies(database)
      end

      def list(database:, host: 'localhost', port: 8086, **payload)
        InfluxDB::Client.new(host: payload[:host]).list_retention_policies(database)
      end

      def self.delete(payload); end

      def self.alter(payload); end
    end
  end
end
