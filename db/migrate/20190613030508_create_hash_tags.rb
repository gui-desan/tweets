# frozen_string_literal: true

class CreateHashTags < ActiveRecord::Migration[5.2]
  def change
    create_table :hash_tags do |t|
      t.string :name
      t.integer :tag_count, default: 0
      t.timestamps

      t.index :name
    end

    create_table :hash_tags_tweets, id: false do |t|
      t.references :tweet
      t.references :hash_tag

      t.foreign_key :tweets, on_delete: :cascade
      t.foreign_key :hash_tags
    end
  end
end
