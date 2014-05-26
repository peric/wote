OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '304913529675268', '969a9fa48c82c229f419fe6bcbea3a75'
end
