require 'spec_helper'

describe AlfaBank::Client do
  describe 'sending request' do
    before do
      AlfaBank.configure do |config|
        config.base_link = 'tester_base_link'
      end
    end
    let(:creds) { { user_name: 'tester', password: 'pass' } }

    AlfaBank::Constants::REQUIRED_FIELDS.each_pair do |request, fields|
      it "sends #{request} request to AlfaBank" do
        expect_any_instance_of(AlfaBank::RequestSender).to receive(:call)
        h = build_params(fields)
        described_class.public_send(request, h, creds)
      end
    end

    it 'raises error for :test request' do
      h = build_params(AlfaBank::Constants::REQUIRED_FIELDS[:register_order])
      expect { described_class.public_send(:test, h, creds) }
        .to raise_error(NoMethodError)
    end
  end
end
