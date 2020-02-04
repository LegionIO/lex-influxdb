# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Transport
        module Queues
          class Continuousq < Legion::Transport::Queue
            def queue_name
              'influxdb.continuous_query'
            end
          end
        end
      end
    end
  end
end
