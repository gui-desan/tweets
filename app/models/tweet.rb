class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :reply, :class_name => "Tweet"
  belongs_to :retweet, :class_name => "Tweet"
  has_many :likes
  has_many :users, through: :likes
  has_many :replies, :foreign_key => "tweet_id", :class_name => "Tweet"
  has_many :retweets, :foreign_key => "retweet_id", :class_name => "Tweet"

  validates :content, length: {
    maximum: 256,
    too_long: '%{count} characters is the maximum allowed'
  }, presence: true

  scope :threads, -> { where(tweet_id: nil) }
  scope :replies, -> { where.not(tweet_id: nil) }
  scope :retweets, -> { where.not(retweed_id: nil) }
end
