require 'pry'
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
      if params[:content] == ""
        redirect "tweets/new"
      else
        @tweet = Tweet.create(:content => params[:content])
        @user = User.find_by(params[:id])
        @tweet.user_id = @user.id
        @tweet.save
        erb :'tweets/show'
      end
    else
      redirect "/login"
    end
  end

  get "/tweets/:id" do
    if logged_in?
      @user = current_user
      @tweet = Tweet.find_by(id: params[:id])
      erb :'tweets/show'
    else
      redirect "/login"
    end
  end

  post '/tweets/:id' do
    if logged_in? && current_user.include?(@tweet)
      @tweet = Tweet.find_by(id: params[:id])
      erb :'tweets/show'
    else
      erb :'users/login'
    end

  end

  get '/tweets/:id/edit' do
    if logged_in?
      if params[:content] != ""
        @tweet = Tweet.find_by(id: params[:id])
        erb :'tweets/edit'
      end

    else
      redirect 'users/login'
    end
  end

  patch '/tweets/:id' do
    @tweet = Tweet.find_by(id: params[:id])
    if logged_in?
      @tweet.update(content: params[:content])
      erb :'/tweets/show'
    else
      erb :'users/login'
    end
  end

  delete '/tweets/:id/delete' do
    tweet = current_user.tweets.find_by(id: params[:id])
    if tweet && tweet.destroy
      redirect to '/tweets'
    else
      redirect to "/tweets/#{params[:id]}"

    end
  end

end
