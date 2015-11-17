require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
  describe '#current_user' do
    context 'with a current user in the session' do
      let(:user) { create :user }
      let(:session) { { user_id: user.id } }

      before do
        expect(subject).to receive(:session).twice.and_return(session)
      end

      it 'returns the user' do
        expect(subject.current_user).to eq(user)
      end
    end

    context 'without a current user in the session' do
      it 'returns nil' do
        expect(subject.current_user).to be_nil
      end
    end

    context 'with an invalid user in the session' do
      let(:session) { { user_id: 42 } }

      before do
        expect(subject).to receive(:session).twice.and_return(session)
      end

      it 'returns nil' do
        expect(subject.current_user).to be_nil
      end
    end
  end

  describe '#user_signed_in?' do
    context 'when there is a user logged in' do
      before do
        expect(subject).to receive(:current_user).and_return(true)
      end

      it 'returns true' do
        expect(subject.user_signed_in?).to be_truthy
      end
    end

    context 'when there is no user logged in' do
      it 'returns false' do
        expect(subject.user_signed_in?).to be_falsy
      end
    end
  end

  describe '#user_is_creator?' do
    context 'when the current user is a creator' do
      before do
        expect(subject).to receive(:current_user).and_return build :creator
      end

      it 'returns true' do
        expect(subject.user_is_creator?).to be_truthy
      end
    end

    context 'when the current user is not a creator' do
      before do
        expect(subject).to receive(:current_user).and_return build :user
      end

      it 'returns false' do
        expect(subject.user_is_creator?).to be_falsy
      end
    end
  end

  describe '#user_is_admin' do
    context 'when the current user is an admin' do
      before do
        expect(subject).to receive(:current_user).and_return build :admin
      end

      it 'returns true' do
        expect(subject.user_is_admin?).to be_truthy
      end
    end

    context 'when the current user is not an admin' do
      before do
        expect(subject).to receive(:current_user).and_return build :user
      end

      it 'returns false' do
        expect(subject.user_is_admin?).to be_falsy
      end
    end
  end
end
