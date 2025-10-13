require File.join(File.dirname(__FILE__), "constants")
require 'active_support/core_ext/string/inflections'

module AlfaBank
  module RestDataBuilder
    def self.build_params(key, args)
      unless Constants::ALFA_LINKS.key?(key)
        raise NoMethodError, "#{key} type of request does not supported by AlfaBank adapter"
      end
      args.transform_keys { |key| key.to_s.camelize(:lower) }
    end
  end
end
