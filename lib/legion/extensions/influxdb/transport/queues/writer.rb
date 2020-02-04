module Legion
  module Extensions
    module Influxdb
      module Transport
        module Queues
          class Writer < Legion::Transport::Queue
            def queue_name
              'influxdb.writer'
            end
          end
        end
      end
    end
  end
end
