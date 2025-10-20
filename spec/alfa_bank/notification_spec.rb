require 'spec_helper'

describe AlfaBank::Notification do

  subject(:notification) { described_class.new(data: notification_params) }
  before do
    AlfaBank.configure do |config|
      config.notification_secret_key = "notification_secret_key"
    end
  end

  describe 'authorize' do
    context 'success notified' do
      let(:notification_params) do
        {
            "orderNumber" => "5614671600",
            "authorizeId" => "3292449",
              "paymentId" => "5614671600",
               "checksum" => "B99080859D1ABF54860AE0FD272830F474B0D5052D47C55E64FCC22FC81CBA13",
                "mdOrder" => "0148d843-4753-71a6-afdd-e8ca0257a4c8",
              "operation" => "approved",
                 "status" => "1"
        }
      end

      it 'response to to_h' do
        expect(notification.to_h).to eq(notification_params)
      end

      it 'should be success' do
        expect(notification.success?).to be_truthy
      end
      it 'should be valid' do
        expect(notification.valid?).to be_truthy
      end
    end
  end

  describe 'capture' do
    context 'success notified' do
      let(:notification_params) do
        {
            "orderNumber" => "5614671600",
            "authorizeId" => "3292449",
              "paymentId" => "5614671600",
               "checksum" => "32E9115A7EEE487C258499DF654E7234DD9902034256DD2A17F4B96703B8F9C4",
                "mdOrder" => "0148d843-4753-71a6-afdd-e8ca0257a4c8",
              "operation" => "deposited",
                 "status" => "1",
              "captureId" => "3292450"
        }
      end

      it 'response to to_h' do
        expect(notification.to_h).to eq(notification_params)
      end

      it 'should be success' do
        expect(notification.success?).to be_truthy
      end

      it 'should be valid' do
        expect(notification.valid?).to be_truthy
      end
    end
  end

  describe 'refund' do
    context 'success notified' do
      let(:notification_params) do
        {
            "orderNumber" => "5614671600",
            "authorizeId" => "3292449",
              "paymentId" => "5614671600",
               "checksum" => "6B67EA5D293E1072A6E2B46B61BEE26CF8F1C0B6100374096AB30135AF6E412D",
                "mdOrder" => "0148d843-4753-71a6-afdd-e8ca0257a4c8",
                 "status" => "1",
              "captureId" => "3292450",
              "operation" => "refunded",
               "refundId" => "12349"
        }
      end

      it 'response to to_h' do
        expect(notification.to_h).to eq(notification_params)
      end

      it 'should be success' do
        expect(notification.success?).to be_truthy
      end

      it 'should be valid' do
        expect(notification.valid?).to be_truthy
      end
    end
  end
end
