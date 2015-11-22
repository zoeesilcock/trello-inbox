RSpec.configure do |config|
  config.include Omniauth::Mock
  config.extend Omniauth::SessionHelpers
  config.include Webhooks
end

OmniAuth.config.test_mode = true
