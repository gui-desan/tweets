# frozen_string_literal: true

class FollowsController < ApplicationController
  def create
    followee_id = User.where.not(id: current_user.id).find_by(name: params[:username]).id
    current_user.follows_to.create(followee_id: followee_id)
    redirect_to root_path
  end

  def destroy
    followee_id = User.where.not(id: current_user.id).find_by(name: params[:username]).id
    current_user.follows_to.find_by(followee_id: followee_id).destroy
    redirect_to root_path
  end
end
