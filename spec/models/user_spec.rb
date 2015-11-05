describe User do

  before(:each) { @user = FactoryGirl.create(:user) }

  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:avatar) }
  it { should respond_to(:creator?) }

  it "#name returns a string" do
    expect(@user.name).to match 'Test User'
  end

end
