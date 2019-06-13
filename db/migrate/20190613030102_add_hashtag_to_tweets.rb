class AddHashtagToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :hashtags, :string
  end
end
