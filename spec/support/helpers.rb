RSpec.configure do |config|
  config.include Omniauth::Mock
  config.extend Omniauth::SessionHelpers
end
OmniAuth.config.test_mode = true
