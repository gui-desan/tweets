# frozen_string_literal: true

class RelationshipsController < ApplicationController
  def index
    @requests = current_user.relationships_from.pendings.includes(:requester)
  end

  def create
    requestee_id = User.where.not(id: current_user.id).find_by(name: params[:username]).id
    current_user.relationships_to.create(requestee_id: requestee_id)
    redirect_to profiles_show_path(params[:username])
  end

  def destroy
    requestee_id = User.where.not(id: current_user.id).find_by(name: params[:username]).id
    relationship = current_user.relationships_to.find_by(requestee_id: requestee_id)
    relationship.requestee.relationships_to.accepteds.find_by(requestee_id: current_user.id).destroy
    relationship.destroy
    redirect_to profiles_show_path(params[:username])
  end

  def cancel
    requestee_id = User.where.not(id: current_user.id).find_by(name: params[:username]).id
    current_user.relationships_to.find_by(requestee_id: requestee_id).destroy
    redirect_to profiles_show_path(params[:username])
  end

  def accept
    relationship = current_user.relationships_from.pendings.find(params[:id])
    relationship.status = 1
    relationship.save
    relationship.requester.relationships_to.pendings.destroy_all
    relationship.requester.relationships_from.pendings.destroy_all
    current_user.relationships_to.pendings.destroy_all
    current_user.relationships_from.pendings.destroy_all
    current_user.relationships_to.create(
      requestee_id: relationship.requester_id,
      relationship_type: relationship.relationship_type,
      status: 1
    )
    redirect_to relationships_index_path
  end

  def reject
    current_user.relationships_from.pendings.find(params[:id]).destroy
    redirect_to relationships_index_path
  end
end
