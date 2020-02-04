module Legion
  module Extensions
    module Influxdb
      module Transport
        module Queues
          class Measurement < Legion::Transport::Queue
            def queue_name
              'influxdb.measurement'
            end
          end
        end
      end
    end
  end
end
