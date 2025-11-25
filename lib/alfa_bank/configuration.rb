module AlfaBank
  class Configuration
    attr_accessor :base_link, :language

    def initialize
      @base_link = "http://alfa_bank_test_url.ru"
      @language = "en"
    end
  end
end
