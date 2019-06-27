# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets

  has_many :likes
  has_many :liked_tweets, through: :likes

  has_many :follows_to, foreign_key: 'follower_id', class_name: 'Follow'
  has_many :followees, through: :follows_to

  has_many :follows_from, foreign_key: 'followee_id', class_name: 'Follow'
  has_many :followers, through: :follows_from

  enum gender: %i[undefined male female]

  validates :name, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
end
