# frozen_string_literal: true

module Legion
  module Extensions
    module Influxdb
      class Client
        include Helpers::Client
        include Runners::Writer
        include Runners::Database
        include Runners::User
        include Runners::RetentionPolicy
        include Runners::ContinuousQuery
        include Runners::Measurement
        include Runners::Series
        include Runners::Cluster

        attr_reader :opts

        def initialize(host: 'localhost', port: 8086, database: nil, **extra)
          @opts = { host: host, port: port, database: database, **extra }
        end

        def client(**override)
          Helpers::Client.client(**@opts, **override)
        end
      end
    end
  end
end
