class CreateHashTags < ActiveRecord::Migration[5.2]
  def change
    create_table :hash_tags do |t|
      t.string :name
      t.bigint :count, default: 1

      t.timestamps
    end
  end
end
