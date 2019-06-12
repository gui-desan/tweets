class AddReplyToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :tweet_id, :bigint
  end
end
