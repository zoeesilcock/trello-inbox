describe User do
  before(:each) { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:avatar) }
  it { should respond_to(:creator?) }
  it { should respond_to(:admin?) }

  describe '.create_with_omniauth' do
    let(:info) { { 'name' => 'Arthur Dent', 'image' => 'site.com/image.png' } }
    let(:auth) { { 'provider' => 'bla', 'uid' => '23', 'info' => info } }

    it 'saves the auth information provided' do
      user = User.create_with_omniauth auth

      expect(user.provider).to eq auth['provider']
      expect(user.uid).to eq auth['uid']
      expect(user.name).to eq auth['info']['name']
      expect(user.avatar).to eq auth['info']['image']
    end
  end

  describe '#owns' do
    context 'inbox' do
      let(:inbox) { build :inbox }

      it 'returns false if the current user does not own the inbox' do
        expect(subject.owns(inbox)).to eq false
      end

      it 'returns true if the current user owns the inbox' do
        inbox.user = subject
        expect(subject.owns(inbox)).to eq true
      end
    end

    context 'idea' do
      let(:idea) { build :idea }

      it 'returns false if the current user does not own the idea' do
        expect(subject.owns(idea)).to eq false
      end

      it 'returns true if the current user owns the idea' do
        idea.user = subject
        expect(subject.owns(idea)).to eq true
      end
    end
  end
end
