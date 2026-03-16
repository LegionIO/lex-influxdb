# frozen_string_literal: true

require 'legion/extensions/influxdb/version'
require 'influxdb'
require 'legion/extensions/influxdb/helpers/client'
require 'legion/extensions/influxdb/runners/writer'
require 'legion/extensions/influxdb/runners/database'
require 'legion/extensions/influxdb/runners/user'
require 'legion/extensions/influxdb/runners/retention_policy'
require 'legion/extensions/influxdb/runners/continuous_query'
require 'legion/extensions/influxdb/runners/measurement'
require 'legion/extensions/influxdb/runners/series'
require 'legion/extensions/influxdb/runners/cluster'
require 'legion/extensions/influxdb/client'

module Legion
  module Extensions
    module Influxdb
      extend Legion::Extensions::Core if Legion::Extensions.const_defined?(:Core)
    end
  end
end
