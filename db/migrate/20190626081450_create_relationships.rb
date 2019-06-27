class CreateRelationships < ActiveRecord::Migration[5.2]
  def change
    create_table :relationships do |t|
      t.references :requester
      t.references :requestee
      t.string :type, :smallint, default: 0
      t.string :status, :smallint, default: 0
      t.timestamps

      t.foreign_key :users, column: :requester_id, on_delete: :cascade
      t.foreign_key :users, column: :requestee_id, on_delete: :cascade
    end
  end
end
