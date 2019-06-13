class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.threads.order(created_at: :desc)
  end

  def create
    @tweet = Tweet.create(tweets_params)
    if @tweet.valid?
      flash[:success] = 'Create successfull.'
      redirect_to tweet_path(@tweet.id)
    else
      flash[:fail] = @tweet.errors.messages
      redirect_to root_path
    end
    
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  private

  def tweets_params
    params.require(:tweet).permit(:content).merge!(user_id: current_user.id)
  end
end
