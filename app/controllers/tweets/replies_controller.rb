class Tweets::RepliesController < ApplicationController
  before_action :authenticate_user!

  def new
    @tweet = Tweet.find(params[:tweet_id])
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @tweet = @tweet.replies.create(reply_params)
    if @tweet.valid?
      flash[:success] = 'Create successfull.'
      redirect_to tweet_path(params[:tweet_id])
    else
      flash[:fail] = @tweet.errors.messages
      redirect_to new_tweet_reply_path
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content).merge!(user_id: current_user.id)
  end
end
