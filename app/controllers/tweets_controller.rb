class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.all
  end

  def create
    @tweet = Tweet.create(tweets_params)
    if @tweet.valid?
      flash[:success] = 'Create successfull.'
    else
      flash[:fail] = @tweet.errors.messages
    end
    redirect_to action: :index
  end

  private

  def tweets_params
    params.require(:tweet).permit(:content).merge!(user_id: current_user.id)
  end
end
