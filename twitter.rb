#!/usr/bin/env ruby 
require "twitter"

$user = USER_STRING
$tweets = TWEETS_INT

Twitter.configure do |config|
  config.consumer_key = CONSUMER_KEY
  config.consumer_secret = CONSUMER_SECRET
  config.oauth_token = OAUTH_TOKEN
  config.oauth_token_secret = OAUTH_TOKEN_SECRET
end

(1..(($tweets/200)+1).ceil).each do |page|
	tl = Twitter.user_timeline($user, {:count => 200, :page => page})
	tl.each_index do |nr|
		if tl != nil then puts tl[nr]['text'] end
	end
end
