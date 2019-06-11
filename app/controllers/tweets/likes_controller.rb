class Tweets::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.likes.create(user_id: current_user.id)
    redirect_to root_path
  end

  def destroy
    @tweet = Tweet.find(params[:tweet_id])
    @tweet.likes.find_by(user_id: current_user.id).destroy
    redirect_to root_path
  end
end
