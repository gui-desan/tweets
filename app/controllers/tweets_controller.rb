# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.threads.loads.order(created_at: :desc)
    flash[:fail] ||= {}
    flash[:params] ||= {}
  end

  def create
    @tweet = Tweet.create(tweets_params)
    if @tweet.valid?
      redirect_to tweet_path(@tweet.id)
    else
      flash[:fail] = @tweet.errors.map { |k, v| [k, "#{k} #{v}".capitalize] }.to_h
      flash[:params] = tweets_params
      redirect_to root_path
    end
  end

  def show
    @tweet = Tweet.loads.find(params[:id])
  end

  private

  def tweets_params
    params.require(:tweet).permit(:content).merge!(user_id: current_user.id)
  end
end
