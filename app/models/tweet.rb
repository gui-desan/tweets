class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :reply, :foreign_key => "tweet_id", :class_name => "Tweet", optional: true
  belongs_to :retweet, :foreign_key => "retweet_id", :class_name => "Tweet", optional: true
  has_many :likes
  has_many :users, through: :likes
  has_many :replies, :foreign_key => "tweet_id", :class_name => "Tweet"
  has_many :retweets, :foreign_key => "retweet_id", :class_name => "Tweet"

  validates :content, length: {
    maximum: 256,
    too_long: '%{count} characters is the maximum allowed'
  }, presence: true

  default_scope { all.includes(:replies, :likes, :users) }
  scope :threads, -> { where(tweet_id: nil) }
  scope :replies, -> { where.not(tweet_id: nil) }
  scope :retweets, -> { where.not(retweed_id: nil) }

  after_create :set_hash_tag

  def set_hash_tag
    content.gsub(/\B#\w*[a-zA-Z]+\w*/).map do |hash_tag|
      if HashTag.exists?(name: hash_tag)
        @hash_tag = HashTag.find_by(name: hash_tag)
        @hash_tag.count += 1
        @hash_tag.save
      else
        HashTag.create(name: hash_tag)
      end
      hash_tags << hash_tag
    end
    save
  end
end
