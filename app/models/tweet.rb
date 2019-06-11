class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :users, through: :likes

  validates :content, length: {
    maximum: 256,
    too_long: '%{count} characters is the maximum allowed'
  }, presence: true
end
