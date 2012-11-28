Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
           :scope => 'user_photos, friends_photos', :display => 'popup',
           redirect_uri:'http://localhost:3000/auth/facebook/callback'
end