class AddHashtagToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :hash_tags, :string, array: true, default: [], null: false
  end
end
