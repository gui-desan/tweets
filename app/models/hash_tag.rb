# frozen_string_literal: true

class HashTag < ApplicationRecord
  has_and_belongs_to_many :tweets
end
