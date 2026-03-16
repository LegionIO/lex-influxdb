# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Runners
        module Writer
          def self.write(series:, data:, database:, **opts)
            host = opts.fetch(:host, 'localhost')
            port = opts.fetch(:port, 8086)
            time_precision = opts.fetch(:time_precision, 's')
            extra = opts.except(:host, :port, :time_precision)
            c = Helpers::Client.client(host: host, port: port, database: database, **extra)
            c.write_point(series, data, time_precision)
            {}
          end

          def self.write_points(metrics:, **opts)
            database = opts.fetch(:database, 'telegraf')
            host = opts.fetch(:host, 'localhost')
            port = opts.fetch(:port, 8086)
            time_precision = opts.fetch(:time_precision, 'ms')
            extra = opts.except(:database, :host, :port, :time_precision)
            metrics = Legion::JSON.load(metrics) if metrics.is_a?(String)
            if metrics[:timestamp].nil?
              metrics[:timestamp] = Time.now.to_i
              time_precision = 's'
            end

            c = Helpers::Client.client(host: host, port: port, database: database, **extra)
            c.write_point('sensors', metrics, time_precision)
            {}
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
