# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Runners
        module Writer
          def self.write(database:, **opts)
            host = opts.fetch(:host, 'localhost')
            port = opts.fetch(:port, 8086)
            InfluxDB::Client.new(database, host: host, port: port)
            {}
          end

          def self.write_points(metrics:, **opts)
            host = opts.fetch(:host, 'localhost')
            port = opts.fetch(:port, 8086)
            database = opts.fetch(:database, 'telegraf')
            time_precision = opts.fetch(:time_precision, 'ms')
            settings[:client] ||= InfluxDB::Client.new(database, host: host, port: port, async: false)
            metrics = Legion::JSON.load(metrics) if metrics.is_a? String
            if metrics[:timestamp].nil?
              metrics[:timestamp] = Time.now.to_i
              time_precision = 's'
            end

            settings[:client].write_point('sensors', metrics, time_precision)
            {}
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
