# frozen_string_literal: true

module AlfaBank
    # AlfaBank::Notification
    class Notification
      SUCCESS_STATUS = '1'

      def initialize(data:)
        define_instances serialized_data(data)
      end

      def success?
        status == SUCCESS_STATUS
      end

      def valid?(secret_key:, signature:)
        true
        # signature == hmac(secret_key)
      end

      def to_h
        Hash[instance_variables.map { |name| [name.to_s.delete('@'), instance_variable_get(name)] }]
      end

      private

      attr_reader :payment_id, :capture_id, :refund_id, :authorize_id, :operation, :status, :checksum

      def serialized_data(data)
        data.transform_keys { |key| key.to_s.underscore }
      end

      def define_instances(data)
        data.each do |k, v|
          instance_variable_set("@#{k}", v)
          self.class.send(:attr_reader, k)
        end
      end
    end
end
