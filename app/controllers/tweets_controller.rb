class TweetsController < ApplicationController

get '/tweets' do
  @tweet = Tweet.all
end

end
