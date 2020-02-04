module Legion
  module Extensions
    module Influxdb
      module Transport
        module Queues
          class User < Legion::Transport::Queue
            def queue_name
              'influxdb.user'
            end
          end
        end
      end
    end
  end
end
