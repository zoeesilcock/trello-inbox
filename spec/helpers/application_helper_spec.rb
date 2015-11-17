require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#current_inbox' do
    context 'with an inbox_id' do
      let!(:inbox) { create :inbox }
      let(:params) { { inbox_id: inbox.id } }

      before do
        expect(helper).to receive(:params).twice.and_return(params)
      end

      it 'returns the inbox' do
        expect(helper.current_inbox).to eq(inbox)
      end
    end

    context 'without an inbox_id' do
      it 'returns nil' do
        expect(helper.current_inbox).to be_nil
      end
    end
  end
end
