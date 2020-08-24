module Legion::Extensions::Influxdb
  module Helpers
    module Client
      def client(**_opts)
        # @client ||= InfluxBD::Client.new
        @client ||= InfluxBD::Client.new('esphome', { host: 'influx.home.whonodes.org', async: false })
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
