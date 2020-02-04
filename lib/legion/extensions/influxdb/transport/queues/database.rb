# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Transport
        module Queues
          class Database < Legion::Transport::Queue
            def queue_name
              'influxdb.database'
            end
          end
        end
      end
    end
  end
end
