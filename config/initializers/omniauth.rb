Rails.application.config.middleware.use OmniAuth::Builder do

  if Rails.env == 'development' || Rails.env == 'test'
    provider :facebook, ENV['DEV_FACEBOOK_KEY'], ENV['DEV_FACEBOOK_SECRET'],
             :scope => 'user_photos, friends_photos', :display => 'popup',
             redirect_uri:'http://localhost:3000/auth/facebook/callback'
  else
    # Production
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
             :scope => 'user_photos, friends_photos', :display => 'popup',
             redirect_uri:'http://localhost:3000/auth/facebook/callback'
  end

end