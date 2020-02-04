# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Transport
        module Exchanges
          class Influxdb < Legion::Transport::Exchange
            def exchange_name
              'influxdb'
            end
          end
        end
      end
    end
  end
end
