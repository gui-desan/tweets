class Tweet < ApplicationRecord
  belongs_to :user

  validates :content, length: {
    maximum: 256,
    too_long: '%{count} characters is the maximum allowed'
  }, presence: true
end
