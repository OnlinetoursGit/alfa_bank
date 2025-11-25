require 'singleton'
require 'json'
require File.join(File.dirname(__FILE__), 'request_sender')

module AlfaBank
  class Client
    include Singleton

    class << self
      def register_order(params, creds)
        send_request(:register_order, params, creds)
      end

      def preauth_register_order(params, creds)
        send_request(:preauth_register_order, params, creds)
      end

      def finish_order(params, creds)
        send_request(:finish_order, params, creds)
      end

      def order_status(params, creds)
        send_request(:order_status, params, creds)
      end

      def extend_request_order_status(params, creds)
        send_request(:extend_request_order_status, params, creds)
      end

      def reverse_order_payment(params, creds)
        send_request(:reverse_order_payment, params, creds)
      end

      def refund_order_sum(params, creds)
        send_request(:refund_order_sum, params, creds)
      end

      def check_3ds(params, creds)
        send_request(:check_3ds, params, creds)
      end

      def adds_params_to_order(params, creds)
        send_request(:adds_params_to_order, params, creds)
      end

      def payment_statistic(params, creds)
        send_request(:payment_statistic, params, creds)
      end

      def payment_to_otherway(params, creds)
        send_request(:payment_to_otherway, params, creds)
      end

      def binding_payment(params, creds)
        send_request(:binding_payment, params, creds)
      end

      def unbind_card(params, creds)
        send_request(:unbind_card, params, creds)
      end

      def bind_card(params, creds)
        send_request(:bind_card, params, creds)
      end

      def extend_binding(params, creds)
        send_request(:extend_binding, params, creds)
      end

      def binding_list(params, creds)
        send_request(:binding_list, params, creds)
      end


      private

      def send_request(request_type, opts, creds)
        response = instance.send(:send_request, request_type, opts, creds)
        JSON.parse(response.body)
      rescue StandardError => e
        { error_class: e.class.to_s, error_message: e.message, backtrace: e.backtrace }
      end
    end

    def send_request(request_type, opts, creds)
      RequestSender.new(request_type, opts, creds).call
    end
  end
end
