class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :user1
      t.references :user2
      t.string :type, :smallint, default: 0
      t.string :status, :smallint, default: 0
      t.timestamps

      t.foreign_key :users, column: :user1_id, on_delete: :cascade
      t.foreign_key :users, column: :user2_id, on_delete: :cascade
    end
  end
end
