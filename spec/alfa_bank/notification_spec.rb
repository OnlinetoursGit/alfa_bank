require 'spec_helper'

describe AlfaBank::Notification do
  describe 'authorize' do
    context 'success notified' do
      let(:notification_params) do
        {
            "orderNumber" => "40",
            "authorizeId" => "12349",
            "sign_alias" => "acallback",
              "paymentId" => "456",
              "checksum" => "8E629D0A3B7EF4B6E5D9883C4B79AC310BB01F2E4415A0332007736F82D2E7CA3AEBFF4E867163F5841F6E1A548E8624EAB7AB10A0F941A85F530D30AF6C1DEBAFF549291D333C8514C95AFEDF2077ABD2D375EEC0E1E3DF8714690F002964B5DB4B25BA846C6A73F9162C748C712FC2B480291B38816586D6E4D588FDE77B7E4BB7E03804A3725838906CFCB2D140DB5B77474B2EEB6906A73D932CA358A30A40726E37B65690BF42650FC7182385B891B48479E356FB0E0958FE75068AAA72645E50D5113E205B6D17E65CBE3D3AD493097707B2B0FFCBF86AE01AF98B84C0770EF8F0A77C27E3A03C19DD765897C79B9679BB49061DBAE22D869157A629EA",
                "mdOrder" => "002cd31b-f59c-7601-adbf-c9550257a4c8",
              "operation" => "approved",
                "status" => "1"
        }
      end

      subject(:notification) { described_class.new(data: notification_params) }

      it 'converts internal representation data fields keys to snake_case' do
        expect(notification.to_h.keys).to eq(%w[order_number authorize_id sign_alias payment_id checksum md_order operation status])
      end

      it 'should be success' do
        expect(notification.success?).to be_truthy
      end

    end
  end
end
