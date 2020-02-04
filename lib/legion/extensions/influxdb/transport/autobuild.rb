require 'legion/extensions/transport/autobuild'

module Legion
  module Extensions
    module Influxdb
      module Transport
        module AutoBuild
          extend Legion::Extensions::Transport::AutoBuild
          def self.e_to_q
            [{
              from:        'influxdb',
              to:          'cluster',
              routing_key: 'cluster'
            },{
                from:        'influxdb',
                to:          'continuousq',
                routing_key: 'continuous_query'
            },{
                from:        'influxdb',
                to:          'database',
                routing_key: 'database'
            },{
                from:        'influxdb',
                to:          'measurement',
                routing_key: 'measurement'
            },{
                from:        'influxdb',
                to:          'retentionpolicy',
                routing_key: 'retention_policy'
            },{
                from:        'influxdb',
                to:          'series',
                routing_key: 'series'
            },{
                from:        'influxdb',
                to:          'user',
                routing_key: 'user'
            },{
                from:        'influxdb',
                to:          'writer',
                routing_key: 'writer'
            }]
          end
        end
      end
    end
  end
end
