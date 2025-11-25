# frozen_string_literal: true

module AlfaBank
    # AlfaBank::Notification
    class Notification
      SUCCESS_STATUS = '1'
      VALUE_SEPARATOR = ';'
      DEFAULT_ALGORITHM = 'sha256'

      def initialize(data:)
        define_instances(data)
      end

      def success?
        status == SUCCESS_STATUS
      end

      def valid?(secret_key: notification_secret_key)
        checksum == hmac(secret_key).upcase
      end

      def to_h
        Hash[instance_variables.map { |name| [name.to_s.delete('@'), instance_variable_get(name)] }]
      end

      private

      def hmac(secret_key)
        digest = OpenSSL::Digest.new(DEFAULT_ALGORITHM)
        OpenSSL::HMAC.hexdigest(digest, secret_key, sorted_param_string)
      end

      def sorted_param_string
        hash = to_h
        hash.delete "sign_alias"
        hash.delete "checksum"
        sorted = hash.sort
        joined = sorted.flatten.join(VALUE_SEPARATOR) << VALUE_SEPARATOR
        joined
      end

      def define_instances(data)
        data.each do |k, v|
          instance_variable_set("@#{k}", v)
          self.class.send(:attr_reader, k)
        end
      end
    end
end
