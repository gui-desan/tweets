# frozen_string_literal: true

class RepliesController < ApplicationController
  before_action :authenticate_user!

  def new
    @tweet = Tweet.find(params[:tweet_id])
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.create(reply_params)
    if @reply.valid?
      redirect_to root_path
    else
      flash[:fail] = @reply.errors.messages
      render :new
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content).merge!(user_id: current_user.id)
  end
end
