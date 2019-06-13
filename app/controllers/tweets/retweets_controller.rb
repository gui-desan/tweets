class Tweets::RetweetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tweet = Tweet.threads.find(params[:tweet_id])
  end

  def create
    @tweet = Tweet.threads.find(params[:tweet_id])
    @tweet = @tweet.retweets.create(retweet_params)
    if @tweet.valid?
      flash[:success] = 'Create successfull.'
      redirect_to root_path
    else
      flash[:fail] = @tweet.errors.messages
      redirect_to new_tweet_retweet_path
    end
  end

  private

  def retweet_params
    params.require(:retweet).permit(:content).merge!(user_id: current_user.id)
  end
end
