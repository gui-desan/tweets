# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_hash_tags, :set_suggestions

  def set_hash_tags
    @hash_tags = HashTag.order(tag_count: :desc).limit(10)
  end

  def set_suggestions
    user_ids = current_user.followees.pluck(:id).push(current_user.id)
    @suggested_users = User.where.not(id: user_ids).order(Arel.sql('RANDOM()')).limit(3)
  end
end
