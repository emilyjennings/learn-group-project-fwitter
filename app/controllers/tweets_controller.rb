class TweetsController < ApplicationController

  get '/tweets' do
    @tweets = Tweet.all
    erb :show
  end

  get '/tweets/new' do
    @tweets = Tweet.all
    erb :new
  end

  post '/tweets' do
    @tweet = Tweet.create(content: params[:content])
    erb :show
  end

  get "/tweets/:id" do
    @tweet = Tweet.find(params[:id])
    redirect '/tweets/#{tweets.id}'
  end

  get '/tweets/:id/edit' do
    erb :edit
  end

  post '/tweets/:id' do
    redirect '/tweets/#{tweets.id}'

    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/tweets'
    else
      redirect to '/login'
    end

  end

end
