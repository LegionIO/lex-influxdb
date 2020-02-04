module Legion
  module Extensions
    module Influxdb
      module Transport
        module Queues
          class Series < Legion::Transport::Queue
            def queue_name
              'influxdb.series'
            end
          end
        end
      end
    end
  end
end
