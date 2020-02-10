module Legion::Extensions::Influxdb
  module Runners
    module User
      def self.create(payload); end

      def self.update_password(payload); end

      def self.grant_user_admin_privileges(payload); end

      def self.grant_user_privileges(payload); end

      def self.delete(payload); end

      def self.list(payload); end
    end
  end
end
