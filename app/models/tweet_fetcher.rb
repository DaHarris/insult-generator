class TweetFetcher

  require 'open-uri'

  attr_reader :client
  attr_reader :insult


  def initialize
    @user = "bobth3bum"
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["CONSUMER_KEY"]
      config.consumer_secret     = ENV["CONSUMER_SECRET"]
      config.access_token        = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
    @friends = [@rey_deloge, @Jess_Koch, @ajamesDesign13, @hkblackstock, @demullane,
      @JordanICollier, @alexandrahanley, @cws322, @ooesili, @KennethT, @caseyK819,
      @ahumanmackenzie, @missylaneuz, @_calebatwood, @tiltedtower, @JakeMarwil, @melissakhat,
      @kerryhouchin, @TyHyten, @fbhewitt]
    @file = open('http://corz.org/public/docs/miscy/insults.txt?raw=true')
    @contents = @file.read
    @insults = @contents.split("\r\n")
    @insult = @insults[rand(@insults.length)]
  end

  def tweet
    @random = @friends[rand(@friends.length)]
    @client.update("#{@random} - #{@insult}")
  end
end
