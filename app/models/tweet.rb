# frozen_string_literal: true

class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :reply, foreign_key: 'reply_id', class_name: 'Tweet', optional: true
  belongs_to :retweet, foreign_key: 'retweet_id', class_name: 'Tweet', optional: true
  has_many :likes
  has_many :users, through: :likes
  has_many :replies, foreign_key: 'reply_id', class_name: 'Tweet'
  has_many :retweets, foreign_key: 'retweet_id', class_name: 'Tweet'
  has_and_belongs_to_many :hash_tags

  validates :content, length: { maximum: 256 }, presence: true

  scope :threads, -> { where(reply_id: nil) }
  scope :replies, -> { where.not(reply_id: nil) }
  scope :retweets, -> { where.not(retweet_id: nil) }

  after_create :set_hash_tag
  before_destroy :unset_hash_tag

  def set_hash_tag
    content.gsub(/\B#\w*[a-zA-Z]+\w*/).uniq.map do |hash_tag|
      hash_tag = HashTag.find_or_create_by(name: hash_tag)
      hash_tag.tag_count += 1
      hash_tag.save
      hash_tags << hash_tag
    end
    save
  end

  def unset_hash_tag
    content.gsub(/\B#\w*[a-zA-Z]+\w*/).uniq.map do |hash_tag|
      hash_tag = HashTag.find_by(name: hash_tag)
      hash_tag.tag_count -= 1
      hash_tag.save
    end
    HashTag.where('tag_count = 0').destroy_all
    save
  end
end
