class ApplicationController < ActionController::Base
  before_action :set_hash_tags

  def set_hash_tags
    @hash_tags = HashTag.all.order(count: :desc).limit(10)
  end
end
