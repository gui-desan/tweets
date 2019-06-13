class HashTagsController < ApplicationController
  before_action :authenticate_user!

  def show
    @hash_tag = HashTag.find_by(name: params[:id])
  end
end
