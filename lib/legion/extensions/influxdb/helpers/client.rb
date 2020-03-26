module Legion::Extensions::Influxdb
  module Helpers
    module Client
      def client(**_opts)
        @client ||= InfluxBD::Client.new
      end

      def host
        'localhost'
      end

      def port
        8086
      end
    end
  end
end
