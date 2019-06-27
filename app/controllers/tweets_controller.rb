# frozen_string_literal: true

class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    user_ids = current_user.followees.pluck(:id).push(current_user.id)
    @tweets = Tweet.threads.where(user_id: user_ids).includes(
      :replies,
      :retweets,
      :users,
      :hash_tags
    )
  end

  def create
    @t = Tweet.create(tweets_params)
    if @t.valid?
      redirect_to root_path
    else
      flash[:fail] = @t.errors.messages
      @tweets = index
      render :index
    end
  end

  def show
    @tweet = Tweet.includes(
      :replies,
      :retweets,
      :users,
      :hash_tags
    ).find(params[:id])
  end

  private

  def tweets_params
    params.require(:tweet).permit(:content).merge!(user_id: current_user.id)
  end
end
