# frozen_string_literal: true

class CreateTweets < ActiveRecord::Migration[5.2]
  def change
    create_table :tweets do |t|
      t.references :user
      t.references :reply
      t.references :retweet
      t.string :content, limit: 256
      t.timestamps

      t.foreign_key :users, on_delete: :cascade
      t.foreign_key :tweets, column: :reply_id, on_delete: :cascade
      t.foreign_key :tweets, column: :retweet_id, on_delete: :nullify
    end
  end
end
