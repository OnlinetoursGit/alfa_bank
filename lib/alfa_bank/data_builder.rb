require File.join(File.dirname(__FILE__), 'constants')
require File.join(File.dirname(__FILE__), 'rest_data_builder')
require 'active_support/core_ext/hash/keys'

module AlfaBank
  class DataBuilder
    attr_accessor :request_type, :opts, :creds

    def initialize(request_type, opts, creds)
      @request_type = request_type
      @opts = opts.symbolize_keys!
      @creds = creds.symbolize_keys!
    end

    def call
      opts.merge!(user_name: user_name, password: password, language: language)
      unless valid?
        raise_custom_error
      end
      data_builder.build_params(request_type, opts)
    end

    def valid?
      fields = Constants::REQUIRED_FIELDS[request_type]
      opts.values_at(*fields).compact.size == fields.size
    rescue
      raise_custom_error
    end

    def link
      "#{AlfaBank.configuration.base_link}/#{Constants::ALFA_LINKS[request_type]}"
    end

    def user_name
      creds[:user_name]
    end

    def password
      creds[:password]
    end

    def language
      AlfaBank.configuration.language
    end

    # TODO: add depandency from config (soap|rest)
    def data_builder
      AlfaBank::RestDataBuilder
    end

    private
    def raise_custom_error
      raise StandardError, 'Please check that params are correct'
    end
  end
end
