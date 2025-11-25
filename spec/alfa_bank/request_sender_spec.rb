require 'spec_helper'

describe AlfaBank::RequestSender do
  describe 'sending request' do
    before do
      AlfaBank.configure do |config|
        config.base_link = 'https://alfa-bank.com/rest'
      end
      allow(Net::HTTP).to receive(:new).and_return(http_client)
    end
    let(:http_client) { instance_double(Net::HTTP, :"use_ssl=" => true) }

    AlfaBank::Constants::REQUIRED_FIELDS.each_pair do |request, fields|
      it "sends http request to AlfaBank for  #{request}" do
        expect(http_client).to receive(:request)
        h = build_params(fields)
        described_class.new(request, h).call
      end
    end
  end
end
