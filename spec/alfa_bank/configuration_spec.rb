require "spec_helper"

module AlfaBank
  describe Configuration do

    describe "#language" do
      it "default value is 'language'" do
        Configuration.new.language = 'ru'
      end
    end

    describe "#language=" do
      it "can set value" do
        config = Configuration.new
        config.language = 'ru'
        expect(config.language).to eq('ru')
      end
    end

    describe "#base_link" do
      it "default value is 'http://alfa_bank_test_url.ru'" do
        Configuration.new.base_link = 'http://alfa_bank_test_url.ru'
      end
    end

    describe "#base_link=" do
      it "can set value" do
        config = Configuration.new
        config.base_link = 'test_base_link'
        expect(config.base_link).to eq('test_base_link')
      end
    end
  end
end
