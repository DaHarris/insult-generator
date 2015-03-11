class TweetFetcher

  def initialize
    @user = "bobth3bum"
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
  end

  def tweet
    @client.update("second twitter and github api test")
  end
end
