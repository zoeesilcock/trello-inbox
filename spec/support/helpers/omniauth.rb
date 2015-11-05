module Omniauth
  module Mock
    def auth_mock
      OmniAuth.config.mock_auth[:google_oauth2] = {
        'provider': 'google_oauth2',
        'uid': '123545',
        'user_info': { 'name': 'mockuser' },
        'credentials': {
          'token': 'mock_token',
          'secret': 'mock_secret'
        }
      }
    end
  end

  module SessionHelpers
    def when_signed_in(&block)
      context 'signed in' do
        let(:current_user) { create :user }

        before do
          request.session[:user_id] = current_user.id
        end

        class_exec(&block)
      end
    end

    def when_signed_in_as_creator(&block)
      context 'signed in as creator' do
        let(:current_user) { create :creator }

        before do
          request.session[:user_id] = current_user.id
        end

        class_exec(&block)
      end
    end
  end
end
