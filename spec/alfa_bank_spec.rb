require "spec_helper"

describe AlfaBank do
  describe "#configure" do
    before do
      AlfaBank.configure do |config|
        config.language = "ru"
        config.base_link = "tester_base_link"
      end
    end
    let(:creds) { { user_name: 'tester', password: 'pass' } }

    it "returns a setted language" do
      language = AlfaBank::DataBuilder.new(:test, {}, creds).language

      expect(language).to eq("ru")
    end

    it "returns a setted base_link" do
      link = AlfaBank::DataBuilder.new(:register_order, {}, creds).link

      expect(link).to include("tester_base_link")
    end
  end
end
