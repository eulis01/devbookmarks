Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.allowed_request_methods = [:post, :get]
    #provider :developer unless Rails.env.production?
    #provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
    provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET']
    #provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRECT']

end