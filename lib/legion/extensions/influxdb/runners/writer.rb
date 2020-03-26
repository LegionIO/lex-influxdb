module Legion::Extensions::Influxdb
  module Runners
    module Writer
      def self.write(series:, tags:, values:, host: 'localhost', port: 8086, database:, **_opts)
        client = InfluxDB::Client.new(database, host: host, port: port)
        {}
      end

      def self.write_points(metrics:, host: 'localhost', port: 8086, database: 'telegraf', **_opts)
        client = InfluxDB::Client.new(database, host: host, port: port)

        client.write_points(metrics)
        {}
      end
    end
  end
end
