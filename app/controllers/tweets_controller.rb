class TweetsController < ApplicationController

  get '/tweets' do
    if logged_in?
      @tweets = Tweet.all
      erb :'tweets/tweets'
    else
      redirect to '/login'
    end
  end

  get '/tweets/new' do
    if logged_in?
      erb :'tweets/new'
    else
      redirect to '/login'
    end
  end

  post '/tweets' do
    if logged_in?
      @tweet = Tweet.create(content: params[:content])
      erb :'tweets/show'
    else
      redirect "/login"
    end
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
