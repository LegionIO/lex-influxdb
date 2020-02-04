# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      module Transport
        module Queues
          class Retentionpolicy < Legion::Transport::Queue
            def queue_name
              'influxdb.retention_policy'
            end
          end
        end
      end
    end
  end
end
