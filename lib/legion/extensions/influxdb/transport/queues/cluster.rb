module Legion
  module Extensions
    module Influxdb
      module Transport
        module Queues
          class Cluster < Legion::Transport::Queue
            def queue_name
              'influxdb.cluster'
            end
          end
        end
      end
    end
  end
end
