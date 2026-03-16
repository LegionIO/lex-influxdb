# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Helpers
        module Client
          module_function

          def client(host: 'localhost', port: 8086, database: nil, **)
            InfluxDB::Client.new(database, host: host, port: port, async: false, **)
          end
        end
      end
    end
  end
end
