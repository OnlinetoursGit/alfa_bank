module AlfaBank
  class Configuration
    attr_accessor :user_name, :password, :base_link, :language, :notification_secret_key

    def initialize
      @user_name = "user_name"
      @password = "password"
      @base_link = "http://alfa_bank_test_url.ru"
      @language = "en"
      @notification_secret_key = "secret key for calculate hmac checksum"
    end
  end
end
