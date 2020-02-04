# frozen_string_literal: true

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
              to:          'database',
              routing_key: 'database'
            }]
          end
        end
      end
    end
  end
end
