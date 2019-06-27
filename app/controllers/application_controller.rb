# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_hash_tags

  def set_hash_tags
    @hash_tags = HashTag.order(tag_count: :desc).limit(10)
  end
end
