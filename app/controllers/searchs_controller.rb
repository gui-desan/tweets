class SearchsController < ApplicationController
  before_action :authenticate_user!

  def index
    @search_hash_tags = HashTag.where("name ILIKE '%#{params[:keyword]}%'")
    @search_users = User.where.not(id: current_user.id).where("name ILIKE '%#{params[:keyword]}%'")
  end
end
