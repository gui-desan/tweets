class CreateFollows < ActiveRecord::Migration[5.2]
  def change
    create_table :follows do |t|
      t.references :follower
      t.references :followee
      t.timestamps

      t.foreign_key :users, column: :follower_id, on_delete: :cascade
      t.foreign_key :users, column: :followee_id, on_delete: :cascade
    end
  end
end
