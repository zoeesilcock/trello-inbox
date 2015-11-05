Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, Rails.application.secrets.omniauth_provider_key,
    Rails.application.secrets.omniauth_provider_secret,
      scope: 'email, profile',
      hd: Rails.application.secrets.google_app_domain
end
