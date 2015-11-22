require 'rails_helper'

RSpec.describe Activity, type: :model do
  let(:activity) { build :activity }

  describe 'validations' do
    it 'requires a user name' do
      activity.user_name = nil
      expect(activity).not_to be_valid
    end

    it 'requires a target' do
      activity.target = nil
      expect(activity).not_to be_valid
    end

    it 'requires an action' do
      activity.action = nil
      expect(activity).not_to be_valid
    end
  end
end
