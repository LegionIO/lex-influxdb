module Legion::Extensions::Influxdb
  module Helpers
    module Client
      def self.client(**opts)
        test = InfluxBD::Client.new(**opts)
      end
    end
  end
end
