# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Runners
        module Writer
          def self.write(series:, tags:, values:, database:, host: 'localhost', port: 8086, **_opts)
            InfluxDB::Client.new(database, host: host, port: port)
            {}
          end

          def self.write_points(metrics:, host: 'localhost', port: 8086, database: 'telegraf', time_precision: 'ms', **_opts)
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
