# frozen_string_literal: true

class RetweetsController < ApplicationController
  before_action :authenticate_user!

  def new
    @tweet = Tweet.threads.find(params[:tweet_id])
  end

  def create
    @tweet = Tweet.threads.find(params[:tweet_id])
    @retweet = @tweet.retweets.create(retweet_params)
    if @retweet.valid?
      redirect_to root_path
    else
      flash[:fail] = @retweet.errors.messages
      render :new
    end
  end

  private

  def retweet_params
    params.require(:retweet).permit(:content).merge!(user_id: current_user.id)
  end
end
