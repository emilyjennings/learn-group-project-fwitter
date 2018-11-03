class TweetsController < ApplicationController

  get '/tweets' do
    @tweet = Tweet.all
    erb :show
  end

  get '/tweets/new' do
    @tweet = Tweet.all
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
  end

end
